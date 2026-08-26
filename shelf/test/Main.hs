import Test.Tasty
import qualified AtomicSpec
import qualified TypesSpec
import qualified ManifestSpec
import qualified MigrateSpec
import qualified ExtractSpec
import qualified ScanSpec
import qualified IndexSpec
import qualified ApplySpec
main :: IO ()
main = defaultMain (testGroup "shelf"
  [ AtomicSpec.tests, TypesSpec.tests, ManifestSpec.tests, MigrateSpec.tests
  , ExtractSpec.tests, ScanSpec.tests, IndexSpec.tests, ApplySpec.tests ])
