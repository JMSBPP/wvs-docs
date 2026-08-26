-- | What the cleanup pass observed about one candidate file, and the decision
-- that follows from it. Everything here is pure and total: 'gatherFacts' does
-- the observing in IO, 'classify' does the deciding, and the split is what
-- lets the property tests explore every combination of facts — including the
-- ones a filesystem would take work to stage.
--
-- The eight conjuncts of the design's §6 are evaluated in their numbered
-- order and the first failure wins, so a file that is both a symlink and
-- untracked is always reported as a symlink. Deleting is the only outcome
-- that needs all eight; every other outcome names the conjunct that stopped
-- it, which is why 'SkipReason' is closed rather than a 'Text'.
module Shelf.Cleanup.Facts
  ( LiveCheck (..)
  , GitFacts (..)
  , gitTop
  , Facts (..)
  , SkipReason (..)
  , Decision (..)
  , isAction
  , classify
  , renderDecision
  , renderSkipReason
  ) where

import Data.Text (Text)
import qualified Data.Text as T
import Shelf.Types (Sha256, Source)

-- | Conjunct 3's second half. 'NotRequired' is a pass, not an omission: a
-- dry run and an @--offline@ execute both decline to ask the remote, and the
-- distinction from 'Verified' is kept so the log can say which one happened.
data LiveCheck = NotRequired | Verified | Failed Text
  deriving stock (Eq, Show)

-- | Conjunct 7's observation, made against the nearest enclosing toplevel.
-- Both in-repo constructors carry that toplevel because the decision — and
-- the @git rm@ that may follow — is addressed to a repository, not a path.
data GitFacts
  = NotInRepo
  | Tracked FilePath Bool Bool
  -- ^ Toplevel, path status clean, whole index clean.
  | UntrackedOrIgnored FilePath
  deriving stock (Eq, Show)

gitTop :: GitFacts -> Maybe FilePath
gitTop = \case
  NotInRepo -> Nothing
  Tracked top _ _ -> Just top
  UntrackedOrIgnored top -> Just top

-- | 'fSha' and 'fSource' are 'Just' only when the re-hashed file's digest was
-- found in the manifest, so conjunct 2 is a look at two 'Maybe's rather than
-- a search repeated inside the classifier.
data Facts = Facts
  { fPath :: FilePath
  , fInShelfCheckout :: Bool
  , fSameInodeAsMirror :: Bool
  , fIsRegular :: Bool
  , fIsSymlink :: Bool
  , fSha :: Maybe Sha256
  , fSource :: Maybe Source
  , fRemoteBacked :: Bool
  , fLive :: LiveCheck
  , fMirrorMatches :: Bool
  , fUnderOtherShelf :: Bool
  , fProvenanceAllowed :: Bool
  , fGit :: GitFacts
  }
  deriving stock (Eq, Show)

-- | The conjunct that refused, in the numbering of §6. 'GitInternal' and
-- 'UnresolvableBase' are the two 'candidates' can raise before any file is
-- looked at: an origin with a @.git@ segment, and an origin that does not
-- resolve under @$HOME@.
data SkipReason
  = ShelfCheckout
  | MirrorInode
  | NotRegular
  | ShaUnknown
  | NotRemoteBacked
  | LiveHeadFailed Text
  | MirrorMissing
  | OtherShelf
  | ProvenanceExcluded
  | TrackedIn FilePath
  | RepoIndexDirty
  | PathDirty
  | GitInternal
  | UnresolvableBase
  deriving stock (Eq, Show)

data Decision = Delete | GitRm FilePath | Skip SkipReason
  deriving stock (Eq, Show)

isAction :: Decision -> Bool
isAction = \case
  Skip _ -> False
  _ -> True

-- | @allowed@ is the canonicalised @--allow-repo@ set; a tracked file outside
-- it is never staged for removal, however clean the repository is.
classify :: [FilePath] -> Facts -> Decision
classify allowed f
  | fInShelfCheckout f = Skip ShelfCheckout
  | fSameInodeAsMirror f = Skip MirrorInode
  | not (fIsRegular f) || fIsSymlink f = Skip NotRegular
  | Nothing <- fSha f = Skip ShaUnknown
  | Nothing <- fSource f = Skip ShaUnknown
  | not (fRemoteBacked f) = Skip NotRemoteBacked
  | Failed why <- fLive f = Skip (LiveHeadFailed why)
  | not (fMirrorMatches f) = Skip MirrorMissing
  | fUnderOtherShelf f = Skip OtherShelf
  | not (fProvenanceAllowed f) = Skip ProvenanceExcluded
  | otherwise = case fGit f of
      NotInRepo -> Delete
      UntrackedOrIgnored _ -> Delete
      Tracked top clean indexClean
        | top `notElem` allowed -> Skip (TrackedIn top)
        | not indexClean -> Skip RepoIndexDirty
        | not clean -> Skip PathDirty
        | otherwise -> GitRm top

renderDecision :: Decision -> Text
renderDecision = \case
  Delete -> "DELETE"
  GitRm top -> "GIT-RM " <> T.pack top
  Skip reason -> "SKIP " <> renderSkipReason reason

renderSkipReason :: SkipReason -> Text
renderSkipReason = \case
  ShelfCheckout -> "shelf-checkout"
  MirrorInode -> "mirror-inode"
  NotRegular -> "not-regular"
  ShaUnknown -> "sha-unknown"
  NotRemoteBacked -> "not-remote-backed"
  LiveHeadFailed why -> "live-head-failed " <> why
  MirrorMissing -> "mirror-missing"
  OtherShelf -> "other-shelf"
  ProvenanceExcluded -> "provenance-excluded"
  TrackedIn repo -> "tracked-in " <> T.pack repo
  RepoIndexDirty -> "repo-index-dirty"
  PathDirty -> "path-dirty"
  GitInternal -> "git-internal"
  UnresolvableBase -> "unresolvable-base"
