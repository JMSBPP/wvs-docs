-- | A WAI stub for the slice of S3 'Shelf.Remote' speaks: @HEAD\/PUT\/DELETE@
-- on the bucket and @HEAD\/GET\/PUT\/DELETE@ on an object, with a 404 path for
-- anything not yet created.
--
-- Every request has its SigV4 signature recomputed from what actually arrived
-- on the wire — the decoded raw path, the raw query, the @Host@ header, the
-- header set named in @SignedHeaders@ and the received
-- @x-amz-content-sha256@ — and a mismatch is a 403. A @PUT@ additionally
-- hashes the body it consumed and 400s when that digest is not the one the
-- signature covered, which is what binds the bytes to the signature.
--
-- Honest limitation: the stub signs with the very module under test
-- ('Shelf.Remote.SigV4'), so a canonicalisation bug would cancel out here.
-- What this catches is the /wiring/ — host header, raw path, query, which
-- headers get signed, payload hash, and re-signing across retries.
-- Canonicalisation itself is pinned by the AWS vectors in "SigV4Spec".
module StubServer (LogEntry, withStub) where

import Crypto.Hash (MD5 (..), SHA256 (..), hashWith)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as BL
import qualified Data.CaseInsensitive as CI
import Data.IORef (IORef, atomicModifyIORef', newIORef, readIORef)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (defaultTimeLocale, parseTimeM)
import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp
import Shelf.Remote.SigV4

-- | Method, raw (still-encoded) path and @x-amz-date@ of one received
-- request, newest first. The date is what proves a retry re-signed rather
-- than replaying the first attempt's headers.
type LogEntry = (ByteString, ByteString, ByteString)

-- | The bucket itself is an entry under the empty key, so one 'IORef' carries
-- both "does the bucket exist" and "what objects does it hold".
bucketMarker :: Text
bucketMarker = ""

-- | Run @k@ against a stub bound to an ephemeral port on the loopback
-- interface, given the credentials it should accept. The refs are, in order,
-- the object store, a countdown of requests to answer with 503, and the
-- request log.
withStub
  :: Credentials
  -> (Int -> IORef (Map Text ByteString) -> IORef Int -> IORef [LogEntry] -> IO a)
  -> IO a
withStub creds k = do
  objects <- newIORef M.empty
  failures <- newIORef 0
  requests <- newIORef []
  -- The abort test deliberately drops a response mid-body; warp's default
  -- handler would print that to stderr as if it were a defect.
  let settings = setOnException (\_ _ -> pure ()) (setHost "127.0.0.1" defaultSettings)
  testWithApplicationSettings settings
    (pure (stubApp creds objects failures requests))
    (\port -> k port objects failures requests)

stubApp :: Credentials -> IORef (Map Text ByteString) -> IORef Int -> IORef [LogEntry] -> Application
stubApp creds objects failures requests req respond = do
  let header n = lookup n (requestHeaders req)
      payloadHash = fromMaybe "" (header "x-amz-content-sha256")
  atomicModifyIORef' requests $ \l ->
    ((requestMethod req, rawPathInfo req, fromMaybe "" (header "x-amz-date")) : l, ())
  if not (verifySignature creds req payloadHash)
    then respond (plain status403 "SignatureDoesNotMatch")
    else do
      failing <- atomicModifyIORef' failures (\n -> (max 0 (n - 1), n))
      if failing > 0
        then consumeRequestBodyStrict req >> respond (plain status503 "SlowDown")
        else route objects payloadHash req respond

route :: IORef (Map Text ByteString) -> ByteString -> Application
route objects payloadHash req respond = case (requestMethod req, pathInfo req) of
  (verb, [_bucket]) -> bucket verb
  (verb, _bucket : rest) -> object verb (T.intercalate "/" rest)
  _ -> respond (plain status405 "MethodNotAllowed")
  where
    isAcl = "acl" `elem` map fst (queryString req)
    withStore f = readIORef objects >>= f
    exists ok = respond (if ok then plain status200 "" else plain status404 "NoSuchBucket")
    bucket verb = case verb of
      "HEAD" -> withStore (exists . M.member bucketMarker)
      "PUT"
        | isAcl -> withStore (exists . M.member bucketMarker)
        | otherwise -> do
            atomicModifyIORef' objects (\m -> (M.insert bucketMarker "" m, ()))
            respond (plain status200 "")
      "DELETE" -> do
        atomicModifyIORef' objects (\m -> (M.delete bucketMarker m, ()))
        respond (responseLBS status204 [] "")
      _ -> respond (plain status405 "MethodNotAllowed")
    object verb key = case verb of
      "PUT" -> do
        body <- BL.toStrict <$> consumeRequestBodyStrict req
        m <- readIORef objects
        if not (M.member bucketMarker m)
          then respond (plain status404 "NoSuchBucket")
          else if sha256Hex body /= payloadHash
            then respond (plain status400 "XAmzContentSHA256Mismatch")
            else do
              atomicModifyIORef' objects (\o -> (M.insert key body o, ()))
              respond (responseLBS status200 [etagHeader body] "")
      -- warp drops the body of a HEAD response but keeps its Content-Length,
      -- so the two read paths can share one builder.
      "GET" -> withStore (respond . serve key)
      "HEAD" -> withStore (respond . serve key)
      "DELETE" -> do
        atomicModifyIORef' objects (\o -> (M.delete key o, ()))
        respond (responseLBS status204 [] "")
      _ -> respond (plain status405 "MethodNotAllowed")

-- | S3 answers a read with an explicit @Content-Length@, and so must this:
-- warp chunks a response whose length the application left unstated, and
-- sends no length at all on a HEAD.
serve :: Text -> Map Text ByteString -> Response
serve key m = case M.lookup key m of
  Nothing -> plain status404 "NoSuchKey"
  Just body -> responseLBS status200
    [etagHeader body, ("Content-Length", BC.pack (show (BS.length body)))]
    (BL.fromStrict body)

plain :: Status -> BL.ByteString -> Response
plain st = responseLBS st [("content-type", "text/plain")]

-- | Hippius returns a quoted 32-hex, MD5-shaped ETag (probe, 2026-08-26).
etagHeader :: ByteString -> Header
etagHeader body = ("ETag", "\"" <> md5Hex body <> "\"")

sha256Hex :: ByteString -> ByteString
sha256Hex b = convertToBase Base16 (hashWith SHA256 b)

md5Hex :: ByteString -> ByteString
md5Hex b = convertToBase Base16 (hashWith MD5 b)

-- | Recompute the signature from the received request and compare. Returns
-- 'False' for anything malformed, which the caller reports as a 403 exactly
-- as S3 would.
verifySignature :: Credentials -> Request -> ByteString -> Bool
verifySignature creds req payloadHash = fromMaybe False $ do
  auth <- lookup "authorization" (requestHeaders req)
  (scope, names, sig) <- parseAuthorization auth
  stamp <- lookup "x-amz-date" (requestHeaders req)
  at <- parseTimeM True defaultTimeLocale "%Y%m%dT%H%M%SZ" (BC.unpack stamp)
  hostValue <- requestHeaderHost req
  let value n
        | n == "host" = hostValue
        | otherwise = fromMaybe "" (lookup n (requestHeaders req))
      signed = [(CI.mk n, value (CI.mk n)) | n <- BC.split ';' names]
      canonical = CanonicalRequest
        { crMethod = requestMethod req
        , crPath = urlDecode False (rawPathInfo req)
        , crQuery = canonicalQuery [(k, fromMaybe "" v) | (k, v) <- queryString req]
        , crHeaders = signed
        , crPayloadHash = payloadHash }
  pure (signature creds at scope canonical == sig)

-- | @AWS4-HMAC-SHA256 Credential=\<ak\>\/\<day\>\/\<region\>\/\<service\>\/aws4_request, SignedHeaders=…, Signature=…@
parseAuthorization :: ByteString -> Maybe (Scope, ByteString, ByteString)
parseAuthorization auth = do
  rest <- BS.stripPrefix "AWS4-HMAC-SHA256 " auth
  let fields = map (BC.dropWhile (== ' ')) (BC.split ',' rest)
      field p = lookup True [(BS.isPrefixOf p f, BS.drop (BS.length p) f) | f <- fields]
  credential <- field "Credential="
  names <- field "SignedHeaders="
  sig <- field "Signature="
  case BC.split '/' credential of
    [_ak, _day, r, s, "aws4_request"] -> Just (Scope r s, names, sig)
    _ -> Nothing
