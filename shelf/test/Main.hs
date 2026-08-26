import Test.Tasty
import qualified TypesSpec
import qualified ManifestSpec
import qualified ExtractSpec
main :: IO ()
main = defaultMain (testGroup "shelf" [TypesSpec.tests, ManifestSpec.tests, ExtractSpec.tests])
