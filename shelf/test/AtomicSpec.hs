module AtomicSpec (tests) where

import Control.Exception (SomeException, try)
import Data.Bits ((.&.))
import qualified Data.ByteString as BS
import System.Directory (createDirectory, listDirectory)
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import System.Posix.Files (fileMode, getFileStatus)
import Test.Tasty
import Test.Tasty.HUnit

import Shelf.Atomic (writeAtomic)

tests :: TestTree
tests = testGroup "Shelf.Atomic"
  [ testCase "the written file is 0644, not the 0600 its temp file was created with" $
      withSystemTempDirectory "shelf-atomic" $ \d -> do
        let p = d </> "out.yaml"
        writeAtomic p "hello"
        st <- getFileStatus p
        (fileMode st .&. 0o777) @?= 0o644
        got <- BS.readFile p
        got @?= "hello"
  , testCase "a failed write leaves no temp file behind" $
      withSystemTempDirectory "shelf-atomic" $ \d -> do
        -- renameFile refuses to replace a directory, so the rename throws
        -- *after* the temp file has been written and chmodded -- exactly the
        -- window in which a leaked .tmp would survive.
        createDirectory (d </> "out.yaml")
        r <- try (writeAtomic (d </> "out.yaml") "hello") :: IO (Either SomeException ())
        assertBool "the write was expected to fail" (either (const True) (const False) r)
        residue <- listDirectory d
        assertEqual "only the destination remains" ["out.yaml"] residue
  ]
