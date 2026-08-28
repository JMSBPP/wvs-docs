module SigV4Spec (tests) where

import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import Data.Bits (shiftL, (.|.))
import Data.List (sort)
import Data.Maybe (fromMaybe)
import Data.Time (UTCTime, defaultTimeLocale, parseTimeM)
import Data.Word (Word8)
import System.Environment (lookupEnv)
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.Hedgehog (testProperty)
import Hedgehog
import qualified Hedgehog as H
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

import Shelf.Remote.SigV4

-- | Parse an @x-amz-date@ literal, so every vector below reads exactly as the
-- AWS documentation prints it.
utcOf :: String -> UTCTime
utcOf s = fromMaybe (error ("SigV4Spec: unparseable time " <> s))
                    (parseTimeM True defaultTimeLocale "%Y%m%dT%H%M%SZ" s)

-- | Assert a pinned signature, printing the canonical request and the
-- string-to-sign on failure: those are what one diffs against the AWS docs,
-- and a bare hex mismatch says nothing about which of the two went wrong.
signatureIs :: Credentials -> UTCTime -> Scope -> CanonicalRequest -> BS.ByteString -> Assertion
signatureIs creds t sc cr expected =
    assertEqual preface expected (signature creds t sc cr)
  where
    canon = canonicalRequest cr
    preface = "--- canonical request ---\n" <> BC.unpack canon
           <> "\n--- string to sign ---\n" <> BC.unpack (stringToSign t sc canon) <> "\n"

-- | Inverse of @uriEncode True@, for the round-trip property only.
uriDecode :: BS.ByteString -> BS.ByteString
uriDecode = BS.pack . go . BS.unpack
  where
    go (0x25 : a : b : rest) | Just hi <- unhex a, Just lo <- unhex b =
        ((hi `shiftL` 4) .|. lo) : go rest
    go (w : rest) = w : go rest
    go [] = []
    unhex :: Word8 -> Maybe Word8
    unhex w | w >= 0x30 && w <= 0x39 = Just (w - 0x30)
            | w >= 0x41 && w <= 0x46 = Just (w - 0x37)
            | w >= 0x61 && w <= 0x66 = Just (w - 0x57)
            | otherwise = Nothing

-- Vector (a1): AWS S3 "Signature Calculations for the Authorization Header:
-- Transferring Payload in a Single Chunk" -- PUT examplebucket/test$file.text.
s3Creds :: Credentials
s3Creds = Credentials "AKIAIOSFODNN7EXAMPLE" "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

s3Scope :: Scope
s3Scope = Scope "us-east-1" "s3"

s3Time :: UTCTime
s3Time = utcOf "20130524T000000Z"

s3Host :: BS.ByteString
s3Host = "examplebucket.s3.amazonaws.com"

putPayloadHash :: BS.ByteString
putPayloadHash = "44ce7dd67c959e0d3524ffac1771dfbba87d2b6b4b4e99e42034a8b803f8b072"

putExtraHeaders :: [(HeaderName, BS.ByteString)]
putExtraHeaders =
  [ ("date", "Fri, 24 May 2013 00:00:00 GMT")
  , ("x-amz-storage-class", "REDUCED_REDUNDANCY") ]

putSigned :: [(HeaderName, BS.ByteString)]
putSigned = signHeaders s3Creds s3Time s3Scope "PUT" s3Host "/test$file.text" []
                        putExtraHeaders putPayloadHash

putCanonical :: BS.ByteString
putCanonical = canonicalRequest CanonicalRequest
  { crMethod = "PUT"
  , crPath = "/test$file.text"
  , crQuery = ""
  , crHeaders = [ ("host", s3Host)
                , ("x-amz-date", "20130524T000000Z")
                , ("x-amz-content-sha256", putPayloadHash) ] <> putExtraHeaders
  , crPayloadHash = putPayloadHash }

-- Vector (b): the generic aws-sig-v4-test-suite cases, service "service".
suiteCreds :: Credentials
suiteCreds = Credentials "AKIDEXAMPLE" "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY"

suiteScope :: Scope
suiteScope = Scope "us-east-1" "service"

suiteTime :: UTCTime
suiteTime = utcOf "20150830T123600Z"

-- The suite signs only host and x-amz-date -- no x-amz-content-sha256 -- so it
-- goes through 'canonicalRequest'/'signature' rather than 'signHeaders'.
suiteRequest :: BS.ByteString -> CanonicalRequest
suiteRequest q = CanonicalRequest
  { crMethod = "GET"
  , crPath = "/"
  , crQuery = q
  , crHeaders = [ ("Host", "example.amazonaws.com")
                , ("X-Amz-Date", "20150830T123600Z") ]
  , crPayloadHash = hashHex "" }

tests :: TestTree
tests = testGroup "Shelf.Remote.SigV4"
  [ testGroup "vector (a): AWS S3 documentation examples"
      [ testCase "single-chunk header-auth PUT of test$file.text" $
          signatureIs s3Creds s3Time s3Scope CanonicalRequest
            { crMethod = "PUT", crPath = "/test$file.text", crQuery = ""
            , crHeaders = [ ("host", s3Host)
                          , ("x-amz-date", "20130524T000000Z")
                          , ("x-amz-content-sha256", putPayloadHash) ] <> putExtraHeaders
            , crPayloadHash = putPayloadHash }
            "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
      , testCase "the canonical URI is single-encoded, $ becomes %24" $
          assertBool (BC.unpack putCanonical)
            ("/test%24file.text" `BS.isInfixOf` putCanonical)
      , testCase "signHeaders reproduces the documented Authorization" $
          assertEqual "authorization"
            (Just "AWS4-HMAC-SHA256 Credential=AKIAIOSFODNN7EXAMPLE/20130524/us-east-1/s3/aws4_request\
                  \, SignedHeaders=date;host;x-amz-content-sha256;x-amz-date;x-amz-storage-class\
                  \, Signature=98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd")
            (lookup "authorization" putSigned)
      , testCase "signHeaders returns host, x-amz-date and x-amz-content-sha256 to send" $
          assertEqual "added headers"
            [Just s3Host, Just "20130524T000000Z", Just putPayloadHash]
            [ lookup "host" putSigned, lookup "x-amz-date" putSigned
            , lookup "x-amz-content-sha256" putSigned ]
      , testCase "presigned GET of test.txt, X-Amz-Expires=86400" $
          assertEqual "X-Amz-Signature"
            (Just "aeeed9bbccd4d02ee5c0109b86d86835f995330da4c265957d157751f604d404")
            (lookup "X-Amz-Signature"
               (presignQuery s3Creds s3Time s3Scope s3Host "/test.txt" 86400))
      , testCase "presignUrl equals AWS's published presigned URL, byte for byte" $
          assertEqual "url"
            "https://examplebucket.s3.amazonaws.com/test.txt?X-Amz-Algorithm=AWS4-HMAC-SHA256\
            \&X-Amz-Credential=AKIAIOSFODNN7EXAMPLE%2F20130524%2Fus-east-1%2Fs3%2Faws4_request\
            \&X-Amz-Date=20130524T000000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host\
            \&X-Amz-Signature=aeeed9bbccd4d02ee5c0109b86d86835f995330da4c265957d157751f604d404"
            (presignUrl s3Creds s3Time s3Scope "https://examplebucket.s3.amazonaws.com"
                        "/test.txt" 86400)
      , testCase "presignUrl tolerates a trailing slash on the endpoint" $
          assertEqual "url"
            (presignUrl s3Creds s3Time s3Scope "https://examplebucket.s3.amazonaws.com" "/t.txt" 60)
            (presignUrl s3Creds s3Time s3Scope "https://examplebucket.s3.amazonaws.com/" "/t.txt" 60)
      , testCase "presign pins algorithm, credential, expires and signed headers" $
          assertEqual "query"
            [ Just "AWS4-HMAC-SHA256"
            , Just "AKIAIOSFODNN7EXAMPLE/20130524/us-east-1/s3/aws4_request"
            , Just "20130524T000000Z", Just "86400", Just "host" ]
            (let q = presignQuery s3Creds s3Time s3Scope s3Host "/test.txt" 86400
             in map (`lookup` q) [ "X-Amz-Algorithm", "X-Amz-Credential"
                                 , "X-Amz-Date", "X-Amz-Expires", "X-Amz-SignedHeaders" ])
      ]
  , testGroup "vector (b): aws-sig-v4-test-suite hygiene"
      [ testCase "get-vanilla" $
          signatureIs suiteCreds suiteTime suiteScope (suiteRequest "")
            "5fa00fa31553b73ebf1942676e86291e8372ff2a2260956d9b8aae1d763fbf31"
      , testCase "get-vanilla-query-order-key-case" $
          signatureIs suiteCreds suiteTime suiteScope
            (suiteRequest (canonicalQuery [("Param2", "value2"), ("Param1", "value1")]))
            "b97d918cfa904a5beff61c982a1b6f458b799221646efd99d3219ec94cdf2500"
      , testCase "canonicalQuery sorts by encoded key and emits k= for an empty value" $
          assertEqual "query" "Param1=value1&Param2=&a%20b=c%2Fd"
            (canonicalQuery [("Param2", ""), ("a b", "c/d"), ("Param1", "value1")])
      ]
  , testGroup "encoding and header folding"
      [ testCase "~ is unreserved and survives uriEncode unencoded" $
          assertEqual "a~b" "a~b" (uriEncode True "a~b")
      , testCase "uriEncode uses uppercase hex and spares only A-Za-z0-9-_.~" $
          assertEqual "encoded" "a%20b%2Fc%3Fd-_.~%2A" (uriEncode True "a b/c?d-_.~*")
      , testCase "renderQuery keeps the given order and encodes both halves" $
          assertEqual "query" "b=x%2Fy&a=&c=1"
            (renderQuery [("b", "x/y"), ("a", ""), ("c", "1")])
      , testCase "duplicate header names merge with a comma, in first-seen order" $
          assertEqual "canonical request"
            "GET\n/\n\nx-dup:one,two\n\nx-dup\ne3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
            (canonicalRequest CanonicalRequest
               { crMethod = "GET", crPath = "/", crQuery = ""
               , crHeaders = [("X-Dup", "one"), ("x-dup", "two")]
               , crPayloadHash = hashHex "" })
      , testCase "header values are trimmed and internal whitespace runs collapse" $
          assertEqual "canonical request"
            "GET\n/\n\nx-ws:a b c\n\nx-ws\ne3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
            (canonicalRequest CanonicalRequest
               { crMethod = "GET", crPath = "/", crQuery = ""
               , crHeaders = [("X-WS", "  a   b\tc  ")]
               , crPayloadHash = hashHex "" })
      ]
  , testCase "vector (c): recorded Hippius HEAD-bucket exchange" hippiusVector
  , testGroup "properties"
      [ testProperty "uriEncode True round-trips through a percent decoder" $ property $ do
          s <- forAll (BC.pack <$> Gen.string (Range.linear 0 40) Gen.ascii)
          uriDecode (uriEncode True s) === s
      , testProperty "uriEncode False round-trips and leaves / alone" $ property $ do
          s <- forAll (BC.pack <$> Gen.string (Range.linear 0 40) Gen.ascii)
          uriDecode (uriEncode False s) === s
          BS.count 0x2F (uriEncode False s) === BS.count 0x2F s
      , testProperty "the five signed parameters are sorted, X-Amz-Signature last" $ property $ do
          n <- forAll (Gen.int (Range.linear (-10) 700000))
          let ks = map fst (presignQuery s3Creds s3Time s3Scope s3Host "/k.pdf" n)
          -- AWS's own published presigned URL orders them this way, and the
          -- vector above pins the resulting string.
          drop 5 ks === ["X-Amz-Signature"]
          take 5 ks === sort (take 5 ks)
      , testProperty "X-Amz-Expires always lands inside S3's [1, 604800]" $ property $ do
          n <- forAll (Gen.int (Range.linear (-1000000) 100000000))
          v <- maybe failure pure (expiresOf n)
          H.assert (1 <= v && v <= 604800)
      , testProperty "X-Amz-Expires is the identity on [1, 604800]" $ property $ do
          n <- forAll (Gen.int (Range.linear 1 604800))
          expiresOf n === Just n
      ]
  ]

-- | Env-gated: the exact HEAD recorded in the Task-0 probe. Skips (passes
-- vacuously, with a note) when the secret is absent, which is the CI case.
hippiusVector :: Assertion
hippiusVector = do
  mSecret <- lookupEnv "HIPPIUS_SECRET_ACCESS_KEY"
  mKeyId <- lookupEnv "HIPPIUS_ACCESS_KEY_ID"
  case (mSecret, mKeyId) of
    (Just secret, Just keyId) | not (null secret), not (null keyId) -> do
      let creds = Credentials (BC.pack keyId) (BC.pack secret)
          signed = signHeaders creds (utcOf "20260826T201813Z") (Scope "decentralized" "s3")
                     "HEAD" "s3.hippius.com" "/cfmm-refs-probe-3f22f6b8" [] [] (hashHex "")
          expected = BS.concat
            [ "AWS4-HMAC-SHA256 Credential=", BC.pack keyId
            , "/20260826/decentralized/s3/aws4_request"
            , ", SignedHeaders=host;x-amz-content-sha256;x-amz-date"
            , ", Signature=885eed674aace9a1fdc6a371db12de03001e848a7d717ff4707d603d25d8a302" ]
      assertEqual "recomputed Authorization" (Just expected) (lookup "authorization" signed)
    _ -> putStrLn "  (skipped: HIPPIUS_SECRET_ACCESS_KEY / HIPPIUS_ACCESS_KEY_ID unset)"

-- | The @X-Amz-Expires@ a presign actually emitted, read back out of the
-- query rather than recomputed -- a property that recomputes the clamp only
-- restates the implementation.
expiresOf :: Int -> Maybe Int
expiresOf n = do
  v <- lookup "X-Amz-Expires" (presignQuery s3Creds s3Time s3Scope s3Host "/k.pdf" n)
  case BC.readInt v of
    Just (i, rest) | BS.null rest -> Just i
    _ -> Nothing
