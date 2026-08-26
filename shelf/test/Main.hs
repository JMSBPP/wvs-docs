import Test.Tasty
import qualified TypesSpec
import qualified ManifestSpec
import qualified ExtractSpec
import qualified ScanSpec
main :: IO ()
main = defaultMain (testGroup "shelf" [TypesSpec.tests, ManifestSpec.tests, ExtractSpec.tests, ScanSpec.tests])
