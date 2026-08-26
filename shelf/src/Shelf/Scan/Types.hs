-- | Row and configuration types for the scan, plus their @scan.yaml@ encoding.
-- Split out of "Shelf.Scan" so the walk and the row assembler can both depend
-- on them without a module cycle.
module Shelf.Scan.Types
  ( Proposal (..), ScanRow (..), srHumanEdited, ScanConfig (..), defaultConfig ) where

import Data.Aeson (FromJSON (..), ToJSON (..), object, withObject, (.!=), (.:), (.:?), (.=))
import Data.Text (Text)
import Shelf.Types

-- | What the tool last proposed for a row. Kept alongside the live fields so
-- 'srHumanEdited' can tell a human decision from a stale machine guess.
data Proposal = Proposal
  { prCitekey :: Text, prTopics :: [Text], prYear :: Year, prProvenance :: Provenance, prInclude :: Bool }
  deriving stock (Eq, Show)

data ScanRow = ScanRow
  { srSha256 :: Sha256, srBytes :: Int, srPaths :: [FilePath], srTitle :: Text, srAuthors :: [Text]
  , srInclude :: Bool, srCitekey :: Text, srTopics :: [Text], srYear :: Year, srProvenance :: Provenance
  , srProposal :: Proposal, srNote :: Text }
  deriving stock (Eq, Show)

instance ToJSON Proposal where
  toJSON p = object
    [ "citekey" .= prCitekey p, "topics" .= prTopics p, "year" .= prYear p
    , "provenance" .= prProvenance p, "include" .= prInclude p ]
instance FromJSON Proposal where
  parseJSON = withObject "proposal" $ \o -> Proposal
    <$> o .: "citekey" <*> o .:? "topics" .!= [] <*> o .: "year" <*> o .: "provenance" <*> o .: "include"

instance ToJSON ScanRow where
  toJSON r = object
    [ "sha256" .= srSha256 r, "bytes" .= srBytes r, "paths" .= srPaths r, "title" .= srTitle r
    , "authors" .= srAuthors r, "include" .= srInclude r, "citekey" .= srCitekey r, "topics" .= srTopics r
    , "year" .= srYear r, "provenance" .= srProvenance r, "proposal" .= srProposal r, "note" .= srNote r ]
-- A hand-written row may omit @proposal@; defaulting it to the row's own
-- fields makes such a row read back as not-human-edited rather than failing.
instance FromJSON ScanRow where
  parseJSON = withObject "scan row" $ \o -> do
    sha <- o .: "sha256"; bytes <- o .:? "bytes" .!= 0; paths <- o .:? "paths" .!= []
    title <- o .:? "title" .!= ""; authors <- o .:? "authors" .!= []
    include <- o .: "include"; key <- o .: "citekey"; topics <- o .:? "topics" .!= []
    year <- o .: "year"; prov <- o .: "provenance"; note <- o .:? "note" .!= ""
    prop <- o .:? "proposal" .!= Proposal key topics year prov include
    pure (ScanRow sha bytes paths title authors include key topics year prov prop note)

-- | True when a human has moved any of the five decision fields away from what
-- the tool last proposed. Derived, never stored, so a hand-edited @scan.yaml@
-- cannot misreport its own state.
srHumanEdited :: ScanRow -> Bool
srHumanEdited r =
  (srInclude r, srCitekey r, srTopics r, srYear r, srProvenance r)
    /= (prInclude p, prCitekey p, prTopics p, prYear p, prProvenance p)
  where p = srProposal r

data ScanConfig = ScanConfig { scRoot :: FilePath, scIncludeRoots :: [FilePath], scExcludeDirs :: [Text] }
  deriving stock (Eq, Show)

defaultConfig :: FilePath -> ScanConfig
defaultConfig home = ScanConfig home roots excludes
  where
    roots = [ "cfmm-refs", "cfmm/cfmm-theory", "cfmms-playground", "apps/d2p", "learning/convex-analysis"
            , "learning/formal-methods", "learning/mechanism-design", "learning/structural-econometrics"
            , "learning/discrete", ".local/share/wvs-shelf/legacy-refs" ]
    -- The last three are the shelf's own working directories under @pdfs/@:
    -- a displaced mirror file, an arXiv download kept for inspection and a
    -- push's verify copy are all PDFs, and none of them is a new source.
    excludes = [ ".git", ".cache", ".TinyTeX", "site-packages", ".venv", "node_modules", "_work", ".stack"
               , ".stack-work", ".cabal", ".ghcup", ".cargo", "go-build", "builds", ".claude"
               , ".displaced", ".arxiv", ".verify" ]
