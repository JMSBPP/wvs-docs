-- | Everything a remote call needs that is not the call itself: where the
-- bucket lives, who signs, how long an attempt may run, and how far apart the
-- retries are. The endpoint and the backoff ladder are constructor arguments
-- rather than constants so a test can point the whole client at a loopback
-- stub and collapse the waits to zero.
--
-- The 'Manager' is created once per configuration and shared by every request
-- made through it: that is what keeps connections pooled across a push of two
-- hundred objects.
module Shelf.Remote.Config
  ( AclMode (..)
  , RemoteConfig (..)
  , defaultEndpoint
  , defaultBucket
  , defaultRegion
  , loadRemoteConfig
  , loadRemoteConfigOptional
  , anonymousCredentials
  , isAnonymous
  , mkRemoteConfig
  , scopeOf
  ) where

import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import Network.HTTP.Client (Manager, newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Shelf.Remote.SigV4 (Credentials (..), Scope (..))
import System.Environment (lookupEnv)

-- | How a freshly created bucket and its objects are made world-readable. The
-- 2026-08-26 probe found Hippius accepts both spellings, so the default is the
-- per-object header: it needs no second request and it survives a bucket that
-- someone else created without an ACL.
data AclMode = BucketAcl | ObjectAcl | NoAcl
  deriving stock (Eq, Show)

data RemoteConfig = RemoteConfig
  { rcEndpoint :: Text
  , rcBucket :: Text
  , rcRegion :: ByteString
  , rcCreds :: Credentials
  , rcManager :: Manager
  , rcBackoff :: [Int]     -- ^ Waits between attempts, microseconds; its length caps the retries.
  , rcAttemptCap :: Int    -- ^ Wall-clock cap on one attempt, microseconds.
  , rcAclMode :: AclMode
  }

defaultEndpoint :: Text
defaultEndpoint = "https://s3.hippius.com"

defaultBucket :: Text
defaultBucket = "cfmm-refs"

defaultRegion :: ByteString
defaultRegion = "decentralized"

-- | @\<region\>\/s3@ — the second half of every credential scope this client signs.
scopeOf :: RemoteConfig -> Scope
scopeOf cfg = Scope { region = rcRegion cfg, service = "s3" }

-- | The credential pair that signs nothing. The bucket is public-read
-- (decision P2-2), so a clone with no keys can still read every object; an
-- empty access key is how the rest of the client recognises that mode.
anonymousCredentials :: Credentials
anonymousCredentials = Credentials "" ""

-- | True when this configuration cannot sign. Reads fall back to an unsigned
-- request; writes and presigned URLs must refuse before they are attempted,
-- since an anonymous signature would be a 403 dressed up as a bug report.
isAnonymous :: RemoteConfig -> Bool
isAnonymous = BS.null . accessKey . rcCreds

-- | Read the environment, requiring credentials: a missing key or secret is a
-- 'Left' naming the variable. This is what @push@ and @url --signed@ use.
-- @HIPPIUS_ACL_MODE@ is @object@ (default), @bucket@ or @none@.
loadRemoteConfig :: IO (Either Text RemoteConfig)
loadRemoteConfig = loadWith required
  where
    required Nothing _ = Left "HIPPIUS_ACCESS_KEY_ID is not set"
    required _ Nothing = Left "HIPPIUS_SECRET_ACCESS_KEY is not set"
    required (Just k) (Just s) = Right (Credentials (encode k) (encode s))

-- | The same, but a missing key or secret yields 'anonymousCredentials'
-- rather than an error — what @fetch@ and a plain @url@ use, so that "any
-- clone can rebuild @pdfs\/@" does not quietly mean "any clone that has
-- credentials". A half-set pair (key without secret) is anonymous too: it
-- cannot sign, and failing on it would strand a clone whose environment is
-- merely untidy.
loadRemoteConfigOptional :: IO (Either Text RemoteConfig)
loadRemoteConfigOptional = loadWith optionalCreds
  where
    optionalCreds (Just k) (Just s) = Right (Credentials (encode k) (encode s))
    optionalCreds _ _ = Right anonymousCredentials

loadWith :: (Maybe String -> Maybe String -> Either Text Credentials) -> IO (Either Text RemoteConfig)
loadWith pick = do
  endpoint <- envOr "HIPPIUS_ENDPOINT" defaultEndpoint
  bucket <- envOr "HIPPIUS_BUCKET" defaultBucket
  region' <- TE.encodeUtf8 <$> envOr "HIPPIUS_REGION" (TE.decodeUtf8 defaultRegion)
  acl <- lookupEnv "HIPPIUS_ACL_MODE"
  key <- lookupEnv "HIPPIUS_ACCESS_KEY_ID"
  secret <- lookupEnv "HIPPIUS_SECRET_ACCESS_KEY"
  case (pick key secret, aclMode acl) of
    (Left e, _) -> pure (Left e)
    (_, Nothing) -> pure (Left "HIPPIUS_ACL_MODE must be one of object, bucket, none")
    (Right creds, Just mode) ->
      Right <$> mkRemoteConfig endpoint bucket region' creds
        [2000000, 8000000, 30000000] (10 * 60 * 1000000) mode
  where
    envOr name fallback = maybe fallback T.pack <$> lookupEnv name
    aclMode = \case
      Nothing -> Just ObjectAcl
      Just "object" -> Just ObjectAcl
      Just "bucket" -> Just BucketAcl
      Just "none" -> Just NoAcl
      Just _ -> Nothing

encode :: String -> ByteString
encode = TE.encodeUtf8 . T.pack

-- | The injectable constructor: same fields, no environment, one new 'Manager'.
mkRemoteConfig
  :: Text        -- ^ endpoint, scheme included
  -> Text        -- ^ bucket
  -> ByteString  -- ^ region
  -> Credentials
  -> [Int]       -- ^ backoff ladder, microseconds
  -> Int         -- ^ per-attempt cap, microseconds
  -> AclMode
  -> IO RemoteConfig
mkRemoteConfig endpoint bucket region' creds backoff cap acl = do
  manager <- newManager tlsManagerSettings
  pure RemoteConfig
    { rcEndpoint = endpoint, rcBucket = bucket, rcRegion = region', rcCreds = creds
    , rcManager = manager, rcBackoff = backoff, rcAttemptCap = cap, rcAclMode = acl }
