import Test.Tasty
import qualified TypesSpec
main :: IO ()
main = defaultMain (testGroup "shelf" [TypesSpec.tests])
