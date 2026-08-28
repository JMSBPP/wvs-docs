-- | The S3 operations the shelf actually performs, expressed over
-- 'Shelf.Remote.Http'. Path-style addressing throughout — @\/bucket\/key@ on
-- the endpoint's host — because Hippius is not @*.amazonaws.com@ and virtual
-- hosting would put the bucket in a DNS name that does not resolve.
--
-- Nothing here interprets the manifest: keys arrive as 'Text' and files as
-- paths, so the push and fetch loops own the policy and this module owns the
-- wire.
module Shelf.Remote
  ( module Shelf.Remote.Config
  , module Shelf.Remote.Http
  , bucketPath
  , objectPath
  , getRequest
  , ensureBucket
  , putObject
  , getObject
  , headObject
  , deleteObject
  , deleteBucket
  , publicUrl
  , presignGet
  ) where

import Control.Monad (void)
import Crypto.Hash (Context, SHA256 (..), hashInitWith, hashUpdate)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Text.Encoding.Error as TEE
import Data.Time (getCurrentTime)
import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)
import Shelf.Atomic (withAtomicOutput)
import Shelf.Remote.Config
import Shelf.Remote.Http
import Shelf.Remote.SigV4 (HeaderName, hashHex, presignUrl, unsignedPayload)
import Shelf.Types (Sha256, objectUrl, sha256Text)
import System.IO (Handle)

bucketPath :: RemoteConfig -> ByteString
bucketPath cfg = "/" <> TE.encodeUtf8 (rcBucket cfg)

objectPath :: RemoteConfig -> Text -> ByteString
objectPath cfg key = bucketPath cfg <> "/" <> TE.encodeUtf8 key

-- | The hash of the empty payload, which is what a bodiless PUT or DELETE
-- signs. 'unsignedPayload' is only correct where the body is not covered at all.
emptyHash :: ByteString
emptyHash = hashHex ""

emptyBody :: RequestBody
emptyBody = RequestBodyBS ""

-- | @ObjectAcl@ is the default: one header on the PUT that already had to
-- happen, and it works on a bucket this tool did not create.
aclHeaders :: RemoteConfig -> [(HeaderName, ByteString)]
aclHeaders cfg = case rcAclMode cfg of
  ObjectAcl -> [("x-amz-acl", "public-read")]
  _ -> []

-- | HEAD the bucket; a 404 means create it. The probe of 2026-08-26 confirmed
-- Hippius accepts a plain bodiless PUT, so no @LocationConstraint@ document is
-- sent — the region already lives in the credential scope.
ensureBucket :: RemoteConfig -> IO (Either RemoteError ())
ensureBucket cfg = do
  probe <- sendExpect cfg [200, 404] (signedRequest cfg "HEAD" (bucketPath cfg) [] [] unsignedPayload emptyBody)
  case probe of
    Left e -> pure (Left e)
    Right resp
      | statusCode (responseStatus resp) == 200 -> pure (Right ())
      | otherwise -> createBucket cfg

-- | The HEAD and this PUT are not one atomic operation, so two pushes racing
-- on a fresh bucket can both see the 404 and both create it. That is benign
-- here: S3 CreateBucket is idempotent for the owner (the probe's plain PUT
-- returns 200 on a bucket that already exists), and the loser's ACL PUT is
-- idempotent too. It would stop being benign against a provider that answers
-- @BucketAlreadyOwnedByYou@ with a 409 — that status is not retriable and
-- would surface as an 'UnexpectedStatus'; add it to the accepted set here
-- rather than retrying if Hippius ever starts doing so.
createBucket :: RemoteConfig -> IO (Either RemoteError ())
createBucket cfg = do
  created <- send cfg (signedRequest cfg "PUT" (bucketPath cfg) [] [] emptyHash emptyBody)
  case created of
    Left e -> pure (Left e)
    Right _
      | rcAclMode cfg == BucketAcl -> void <$> send cfg aclRequest
      | otherwise -> pure (Right ())
  where
    aclRequest = signedRequest cfg "PUT" (bucketPath cfg) [("acl", "")]
      [("x-amz-acl", "public-read")] emptyHash emptyBody

-- | Upload @file@ under @key@, returning the server's ETag. @sha@ is the
-- file's digest and goes on the wire as @x-amz-content-sha256@, so the
-- signature covers the bytes; 'streamFile' sets a real @Content-Length@
-- rather than chunking, and reopens the file on every attempt.
putObject :: RemoteConfig -> Text -> FilePath -> Sha256 -> IO (Either RemoteError Text)
putObject cfg key file sha = do
  uploaded <- send cfg buildRequest
  pure (uploaded >>= etagOf)
  where
    buildRequest = do
      body <- streamFile file
      signedRequest cfg "PUT" (objectPath cfg key) []
        (("content-type", "application/pdf") : aclHeaders cfg)
        (TE.encodeUtf8 (sha256Text sha)) body

-- | A read is the one operation a configuration without credentials can still
-- perform: the bucket is public-read, so an anonymous GET carries no
-- @Authorization@ header at all rather than an empty signature. Everything
-- else in this module signs, and 'Shelf.Remote.Cli.runPush' refuses to start
-- anonymously, so no write can reach the wire unsigned.
getRequest :: RemoteConfig -> Text -> IO Request
getRequest cfg key
  | isAnonymous cfg = plainRequest cfg "GET" (objectPath cfg key) emptyBody
  | otherwise = signedRequest cfg "GET" (objectPath cfg key) [] [] unsignedPayload emptyBody

-- | Stream @key@ into @dest@, hashing as it goes, and return the digest of
-- what arrived — the caller compares it against the manifest rather than
-- trusting the ETag, which is an MD5 shape and says nothing about SHA-256.
--
-- The status is checked before the atomic output is opened, so a 404 leaves
-- no file and no temp file; a retry re-enters this whole block, and
-- 'withAtomicOutput' makes that safe to repeat.
getObject :: RemoteConfig -> Text -> FilePath -> IO (Either RemoteError Sha256)
getObject cfg key dest = sendWith cfg (getRequest cfg key) receive
  where
    receive resp
      | code /= 200 = do
          chunks <- brConsume (responseBody resp)
          pure (Left (UnexpectedStatus code (decodePrefix (BS.concat chunks))))
      | otherwise = Right <$> withAtomicOutput dest (drain (responseBody resp) (hashInitWith SHA256))
      where code = statusCode (responseStatus resp)

drain :: BodyReader -> Context SHA256 -> Handle -> IO Sha256
drain reader ctx h = do
  chunk <- brRead reader
  if BS.null chunk
    then finalizeSha256 ctx
    else BS.hPut h chunk >> drain reader (hashUpdate ctx chunk) h

-- | ETag and length of a stored object, the pair 'Shelf.Cleanup' checks
-- before it deletes a local duplicate.
headObject :: RemoteConfig -> Text -> IO (Either RemoteError (Text, Int))
headObject cfg key = do
  probed <- send cfg (signedRequest cfg "HEAD" (objectPath cfg key) [] [] unsignedPayload emptyBody)
  pure $ do
    resp <- probed
    etag <- etagOf resp
    len <- maybe (Left (HttpFailure "response carried no Content-Length")) Right
      (lookup "Content-Length" (responseHeaders resp) >>= fmap fst . BC.readInt)
    pure (etag, len)

-- | Hippius returns a quoted 32-hex ETag; the quotes are part of the HTTP
-- syntax, not of the value, and the manifest stores the value.
etagOf :: Response body -> Either RemoteError Text
etagOf resp = case lookup "ETag" (responseHeaders resp) of
  Nothing -> Left (HttpFailure "response carried no ETag")
  Just v -> Right (T.dropAround (== '"') (TE.decodeUtf8With TEE.lenientDecode v))

deleteObject :: RemoteConfig -> Text -> IO (Either RemoteError ())
deleteObject cfg key =
  void <$> sendExpect cfg [200, 204] (signedRequest cfg "DELETE" (objectPath cfg key) [] [] emptyHash emptyBody)

-- | Tests only: nothing in the shelf's workflow removes a bucket.
deleteBucket :: RemoteConfig -> IO (Either RemoteError ())
deleteBucket cfg =
  void <$> sendExpect cfg [200, 204] (signedRequest cfg "DELETE" (bucketPath cfg) [] [] emptyHash emptyBody)

publicUrl :: RemoteConfig -> Text -> Text
publicUrl cfg = objectUrl (rcEndpoint cfg) (rcBucket cfg)

-- | A query-signed GET URL valid for @expires@ seconds. On a public-read
-- object this is not a privacy control — anyone with the plain URL already
-- has the bytes — it is a way to hand out a link that stops working.
--
-- The whole URL comes from 'presignUrl' rather than being assembled here:
-- that renderer encodes the path once, in the same pass that signs it, so a
-- key containing a space or a @$@ cannot end up with a wire path the
-- signature does not cover. A hand-rolled @publicUrl <> "?" <> query@ did
-- exactly that, and the test vectors that pin the encoding never saw it.
presignGet :: RemoteConfig -> Text -> Int -> IO Text
presignGet cfg key expires = do
  now <- getCurrentTime
  pure . TE.decodeUtf8 $
    presignUrl (rcCreds cfg) now (scopeOf cfg)
      (TE.encodeUtf8 (rcEndpoint cfg)) (objectPath cfg key) expires
