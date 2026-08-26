import Test.Tasty
import qualified TypesSpec
import qualified ManifestSpec
main :: IO ()
main = defaultMain (testGroup "shelf" [TypesSpec.tests, ManifestSpec.tests])
