-- | The transport under 'Shelf.Remote': signing a 'Request', running it with
-- a per-attempt wall-clock cap, and deciding whether a failure is worth
-- another go.
--
-- Two rules shape everything here. First, @checkResponse@ is disabled: an
-- expected 404 is data ('Shelf.Remote.ensureBucket' asks a question with it),
-- so status handling belongs to the caller's continuation, not to an
-- exception. Second, a retry rebuilds the request from scratch — 'sendWith'
-- takes an @IO Request@, not a @Request@ — because @x-amz-date@ and the
-- signature over it are only valid for a few minutes, and a body streamed
-- from a file has to be reopened anyway.
module Shelf.Remote.Http
  ( RemoteError (..)
  , renderRemoteError
  , retriable
  , decodePrefix
  , sha256OfFile
  , finalizeSha256
  , endpointHost
  , signedRequest
  , sendWith
  , sendExpect
  , send
  ) where

import Control.Concurrent (threadDelay)
import Control.Exception (try)
import Crypto.Hash (Context, SHA256 (..), hashFinalize, hashInitWith, hashUpdate)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as BL
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Text.Encoding.Error as TEE
import Data.Time (getCurrentTime)
import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)
import Shelf.Remote.Config
import Shelf.Remote.SigV4
import Shelf.Types (Sha256, mkSha256, sha256Text)
import System.IO (IOMode (ReadMode), withBinaryFile)
import System.Timeout (timeout)

-- | Everything a remote operation can fail with. @HttpFailure@ carries the
-- rendered 'HttpException'; http-client redacts @Authorization@ in its 'Show'
-- instance, so the secret does not travel into a log line this way.
data RemoteError
  = HttpFailure Text
  | UnexpectedStatus Int Text
  | VerifyMismatch Sha256 Sha256
  | AttemptTimeout
  deriving stock (Eq, Show)

renderRemoteError :: RemoteError -> Text
renderRemoteError = \case
  HttpFailure t -> "transport failure: " <> t
  UnexpectedStatus c b -> "unexpected status " <> T.pack (show c) <> if T.null b then "" else ": " <> b
  VerifyMismatch want got -> "digest mismatch: expected " <> sha256Text want <> ", got " <> sha256Text got
  AttemptTimeout -> "attempt exceeded its wall-clock cap"

-- | Transport failures and server-side congestion are worth another attempt;
-- a rejected signature or a missing key is not, and retrying it only burns
-- the ladder. A 'VerifyMismatch' is retriable because it means a corrupted
-- transfer, which is exactly what a second upload fixes.
retriable :: RemoteError -> Bool
retriable = \case
  HttpFailure _ -> True
  AttemptTimeout -> True
  VerifyMismatch _ _ -> True
  UnexpectedStatus c _ -> c == 408 || c == 429 || c >= 500

-- | The leading bytes of an error body, for a message a human reads. S3
-- errors are XML and the useful part is at the front.
decodePrefix :: ByteString -> Text
decodePrefix = T.strip . TE.decodeUtf8With TEE.lenientDecode . BS.take 512

-- | One mebibyte per 'hashUpdate': the digest of a 3 MB PDF never needs the
-- whole file resident, which is why this exists rather than @hashlazy@ over
-- a @readFile@.
sha256OfFile :: FilePath -> IO Sha256
sha256OfFile p = withBinaryFile p ReadMode (go (hashInitWith SHA256))
  where
    go ctx h = do
      chunk <- BS.hGet h (1024 * 1024)
      if BS.null chunk then finalizeSha256 ctx else go (hashUpdate ctx chunk) h

-- | Close an incremental digest into the manifest's validated newtype. The
-- rendering is 64 lowercase hex characters, so the 'mkSha256' check cannot
-- fail; it is threaded through anyway rather than asserted away.
finalizeSha256 :: Context SHA256 -> IO Sha256
finalizeSha256 ctx =
  either (fail . T.unpack) pure
    (mkSha256 (TE.decodeUtf8 (convertToBase Base16 (hashFinalize ctx) :: ByteString)))

baseRequest :: RemoteConfig -> IO Request
baseRequest cfg = parseRequest (T.unpack (T.dropWhileEnd (== '/') (rcEndpoint cfg)))

-- | The @Host@ header value the signature has to cover: the port is part of
-- it unless it is the default for the scheme. This mirrors what http-client
-- would generate, and is then sent explicitly so the two can never drift.
hostHeaderOf :: Request -> ByteString
hostHeaderOf r
  | secure r, port r == 443 = host r
  | not (secure r), port r == 80 = host r
  | otherwise = host r <> BC.pack (':' : show (port r))

endpointHost :: RemoteConfig -> IO ByteString
endpointHost cfg = hostHeaderOf <$> baseRequest cfg

-- | Build and sign one request against the clock now. @rawPath@ is the
-- unencoded @\/bucket\/key@; the wire path is its single encoding, which is
-- also what the canonical request signs.
signedRequest
  :: RemoteConfig
  -> ByteString                   -- ^ method
  -> ByteString                   -- ^ raw path
  -> [(ByteString, ByteString)]   -- ^ query parameters
  -> [(HeaderName, ByteString)]   -- ^ extra headers to sign and send
  -> ByteString                   -- ^ payload hash, or 'unsignedPayload'
  -> RequestBody
  -> IO Request
signedRequest cfg verb rawPath query extra payloadHash body = do
  base <- baseRequest cfg
  now <- getCurrentTime
  let signed = signHeaders (rcCreds cfg) now (scopeOf cfg) verb (hostHeaderOf base)
                 rawPath query extra payloadHash
  pure base
    { method = verb
    , path = uriEncode False rawPath
    , queryString = if null query then "" else "?" <> canonicalQuery query
    -- An empty Accept-Encoding tells http-client to negotiate none at all, so
    -- a PDF arrives as the bytes that were hashed. It is stripped before the
    -- request is written, which is why it is added after signing.
    , requestHeaders = ("accept-encoding", "") : signed
    , requestBody = body
    , checkResponse = \_ _ -> pure ()
    , responseTimeout = responseTimeoutMicro 300000000
    }

-- | Run @mkReq@ under the attempt cap, hand the live response to @k@, and
-- climb the backoff ladder while the failure is retriable. @k@ owns status
-- interpretation and runs again in full on a retry, so a continuation that
-- writes a file must be safe to restart — 'Shelf.Atomic.withAtomicOutput' is.
-- An exception thrown by @k@ itself is a defect, not a transport fault, and
-- propagates untouched.
sendWith
  :: RemoteConfig
  -> IO Request
  -> (Response BodyReader -> IO (Either RemoteError a))
  -> IO (Either RemoteError a)
sendWith cfg mkReq k = go (rcBackoff cfg)
  where
    go delays = do
      outcome <- attempt
      case (outcome, delays) of
        (Left e, d : ds) | retriable e -> threadDelay d >> go ds
        _ -> pure outcome
    attempt = do
      req <- mkReq
      result <- try @HttpException (timeout (rcAttemptCap cfg) (withResponse req (rcManager cfg) k))
      pure $ case result of
        Left e -> Left (classify e)
        Right Nothing -> Left AttemptTimeout
        Right (Just r) -> r

-- | With @checkResponse@ disabled a 'StatusCodeException' cannot reach us;
-- it is mapped rather than lumped into 'HttpFailure' so that if some future
-- code path re-enables the check, the retry decision stays status-driven.
classify :: HttpException -> RemoteError
classify e = case e of
  HttpExceptionRequest _ (StatusCodeException resp body) ->
    UnexpectedStatus (statusCode (responseStatus resp)) (decodePrefix body)
  _ -> HttpFailure (T.pack (show e))

-- | Read the whole body and accept only the listed statuses. Everything else
-- becomes an 'UnexpectedStatus' carrying the body prefix, which 'retriable'
-- then classifies — so a 503 here retries and a 403 does not.
sendExpect :: RemoteConfig -> [Int] -> IO Request -> IO (Either RemoteError (Response BL.ByteString))
sendExpect cfg ok mkReq = sendWith cfg mkReq $ \resp -> do
  chunks <- brConsume (responseBody resp)
  let code = statusCode (responseStatus resp)
  pure $ if code `elem` ok
    then Right resp { responseBody = BL.fromChunks chunks }
    else Left (UnexpectedStatus code (decodePrefix (BS.concat chunks)))

send :: RemoteConfig -> IO Request -> IO (Either RemoteError (Response BL.ByteString))
send cfg = sendExpect cfg [200, 201, 204]
