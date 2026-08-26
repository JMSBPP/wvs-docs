-- | AWS Signature Version 4 in its S3 dialect: pure, no IO, no clock, no
-- environment. Every function takes the one 'UTCTime' the caller threads
-- through a request, so a signature is reproducible from a recorded exchange
-- -- which is how the test vectors pin it.
--
-- The S3 dialect differs in one place that matters: the canonical URI is the
-- /raw/ path, single-encoded and never normalised. @.@, @..@ and repeated
-- slashes stay as written, because S3 keys may contain them and the server
-- signs what it received; the generic rule's second encoding pass breaks S3.
module Shelf.Remote.SigV4
  ( Credentials (..)
  , Scope (..)
  , HeaderName
  , CanonicalRequest (..)
  , unsignedPayload
  , hashHex
  , uriEncode
  , canonicalQuery
  , canonicalRequest
  , stringToSign
  , signingKey
  , signature
  , signHeaders
  , presignQuery
  , amzDate
  , credentialScope
  ) where

import Crypto.Hash (SHA256 (..), hashWith)
import Crypto.MAC.HMAC (HMAC, hmac)
import Data.ByteArray (convert)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import Data.Bifunctor (bimap)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import Data.CaseInsensitive (CI)
import qualified Data.CaseInsensitive as CI
import Data.List (sort, sortOn)
import qualified Data.Map.Strict as M
import Data.Time (UTCTime, defaultTimeLocale, formatTime)
import Data.Word (Word8)

-- | An S3 access key pair. 'Show' masks the secret: these values reach test
-- failure messages and log lines.
data Credentials = Credentials { accessKey :: ByteString, secretKey :: ByteString }
  deriving stock (Eq)

instance Show Credentials where
  show c = "Credentials " <> show (accessKey c) <> " <secret elided>"

-- | The @<region>/<service>@ half of a credential scope. Hippius uses
-- @region = "decentralized"@, @service = "s3"@.
data Scope = Scope { region :: ByteString, service :: ByteString }
  deriving stock (Eq, Show)

type HeaderName = CI ByteString

-- | The five signed components of a request. @crQuery@ is already canonical
-- (see 'canonicalQuery'); @crPath@ is raw.
data CanonicalRequest = CanonicalRequest
  { crMethod :: ByteString
  , crPath :: ByteString
  , crQuery :: ByteString
  , crHeaders :: [(HeaderName, ByteString)]
  , crPayloadHash :: ByteString
  } deriving stock (Eq, Show)

-- | The @x-amz-content-sha256@ value for requests whose body is not hashed:
-- GET, HEAD, and every presigned URL.
unsignedPayload :: ByteString
unsignedPayload = "UNSIGNED-PAYLOAD"

-- | Lowercase hex SHA-256, the form every SigV4 field wants.
hashHex :: ByteString -> ByteString
hashHex = convertToBase Base16 . hashWith SHA256

hmacSHA256 :: ByteString -> ByteString -> ByteString
hmacSHA256 k m = convert (hmac k m :: HMAC SHA256)

-- | RFC 3986 percent-encoding with the AWS unreserved set
-- (@A-Za-z0-9-_.~@) and uppercase hex digits. @encodeSlash@ is 'False' for a
-- path segment (S3 keys keep their @/@) and 'True' for query keys and values.
uriEncode :: Bool -> ByteString -> ByteString
uriEncode encodeSlash = BS.concatMap enc
  where
    enc :: Word8 -> ByteString
    enc w
      | unreserved w = BS.singleton w
      | w == 0x2F, not encodeSlash = BS.singleton w
      | otherwise = BS.pack [0x25, hexDigit (w `div` 16), hexDigit (w `mod` 16)]
    unreserved :: Word8 -> Bool
    unreserved w =
      (w >= 0x41 && w <= 0x5A) || (w >= 0x61 && w <= 0x7A)
        || (w >= 0x30 && w <= 0x39) || w `BS.elem` "-_.~"
    hexDigit :: Word8 -> Word8
    hexDigit d = if d < 10 then 0x30 + d else 0x41 + (d - 10)

-- | Encode both halves of every parameter, sort by encoded key then value,
-- join with @&@. An empty value still emits its @=@.
canonicalQuery :: [(ByteString, ByteString)] -> ByteString
canonicalQuery =
  BS.intercalate "&" . map (\(k, v) -> k <> "=" <> v) . sort
    . map (bimap (uriEncode True) (uriEncode True))

-- | Lowercase names, trimmed values, duplicates merged with a comma, sorted
-- by name. Both the canonical request and @SignedHeaders@ are built from this
-- one list, so the two can never disagree.
foldedHeaders :: [(HeaderName, ByteString)] -> [(ByteString, ByteString)]
foldedHeaders hs =
  M.toAscList (M.fromListWith (\new old -> old <> "," <> new)
                 [(CI.foldedCase k, trimValue v) | (k, v) <- hs])

-- | Strip leading/trailing whitespace, collapse internal runs to one space.
trimValue :: ByteString -> ByteString
trimValue =
  BS.intercalate " " . filter (not . BS.null)
    . BS.splitWith (\w -> w == 0x20 || w == 0x09 || w == 0x0D || w == 0x0A)

signedHeaderNames :: [(ByteString, ByteString)] -> ByteString
signedHeaderNames = BS.intercalate ";" . map fst

canonicalRequest :: CanonicalRequest -> ByteString
canonicalRequest cr = BS.intercalate "\n"
  [ crMethod cr
  , if BS.null (crPath cr) then "/" else uriEncode False (crPath cr)
  , crQuery cr
  , BS.concat [n <> ":" <> v <> "\n" | (n, v) <- hs]
  , signedHeaderNames hs
  , crPayloadHash cr ]
  where hs = foldedHeaders (crHeaders cr)

-- | @yyyymmddThhmmssZ@ -- the @x-amz-date@ / @X-Amz-Date@ format.
amzDate :: UTCTime -> ByteString
amzDate = BC.pack . formatTime defaultTimeLocale "%Y%m%dT%H%M%SZ"

amzDay :: UTCTime -> ByteString
amzDay = BC.pack . formatTime defaultTimeLocale "%Y%m%d"

-- | @<yyyymmdd>/<region>/<service>/aws4_request@.
credentialScope :: UTCTime -> Scope -> ByteString
credentialScope t sc = BS.intercalate "/" [amzDay t, region sc, service sc, "aws4_request"]

-- | Takes the /rendered/ canonical request, so a caller that printed it for a
-- diff signs the very bytes it printed.
stringToSign :: UTCTime -> Scope -> ByteString -> ByteString
stringToSign t sc canon =
  BS.intercalate "\n" ["AWS4-HMAC-SHA256", amzDate t, credentialScope t sc, hashHex canon]

-- | The four chained HMACs -- scoped to one day, region and service, so a
-- stolen signing key expires on its own.
signingKey :: Credentials -> UTCTime -> Scope -> ByteString
signingKey creds t sc =
  foldl' hmacSHA256 ("AWS4" <> secretKey creds) [amzDay t, region sc, service sc, "aws4_request"]

signature :: Credentials -> UTCTime -> Scope -> CanonicalRequest -> ByteString
signature creds t sc cr =
  convertToBase Base16
    (hmacSHA256 (signingKey creds t sc) (stringToSign t sc (canonicalRequest cr)))

-- | Header authentication. Always adds and signs @host@, @x-amz-date@ and
-- @x-amz-content-sha256@ on top of the caller's headers, and returns the full
-- set to put on the wire including @authorization@.
signHeaders
  :: Credentials -> UTCTime -> Scope
  -> ByteString                      -- ^ method
  -> ByteString                      -- ^ host, including a non-default port
  -> ByteString                      -- ^ raw path
  -> [(ByteString, ByteString)]      -- ^ query parameters
  -> [(HeaderName, ByteString)]      -- ^ extra headers to sign and send
  -> ByteString                      -- ^ payload hash, or 'unsignedPayload'
  -> [(HeaderName, ByteString)]
signHeaders creds t sc method host path query extra payloadHash = hs <> [("authorization", auth)]
  where
    hs = [ ("host", host), ("x-amz-date", amzDate t)
         , ("x-amz-content-sha256", payloadHash) ] <> extra
    cr = CanonicalRequest { crMethod = method, crPath = path
                          , crQuery = canonicalQuery query, crHeaders = hs
                          , crPayloadHash = payloadHash }
    auth = BS.concat
      [ "AWS4-HMAC-SHA256 Credential=", accessKey creds, "/", credentialScope t sc
      , ", SignedHeaders=", signedHeaderNames (foldedHeaders hs)
      , ", Signature=", signature creds t sc cr ]

-- | Query authentication for a GET: only @host@ is signed and the payload is
-- 'unsignedPayload', so the URL works from any client. @expires@ is clamped to
-- S3's [1, 604800] seconds rather than rejected -- duration arithmetic
-- overflowing a week should not fail a fetch.
presignQuery
  :: Credentials -> UTCTime -> Scope
  -> ByteString                      -- ^ host
  -> ByteString                      -- ^ raw path
  -> Int                             -- ^ expires, seconds
  -> [(ByteString, ByteString)]
presignQuery creds t sc host path expires =
    sortOn fst (base <> [("X-Amz-Signature", signature creds t sc cr)])
  where
    secs = max 1 (min 604800 expires)
    base = [ ("X-Amz-Algorithm", "AWS4-HMAC-SHA256")
           , ("X-Amz-Credential", accessKey creds <> "/" <> credentialScope t sc)
           , ("X-Amz-Date", amzDate t)
           , ("X-Amz-Expires", BC.pack (show secs))
           , ("X-Amz-SignedHeaders", "host") ]
    cr = CanonicalRequest { crMethod = "GET", crPath = path
                          , crQuery = canonicalQuery base
                          , crHeaders = [("host", host)]
                          , crPayloadHash = unsignedPayload }
