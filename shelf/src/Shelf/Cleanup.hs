-- | Removing a duplicate PDF from the machine, once the shelf can prove it
-- has a copy. The proof is eight conjuncts wide ("Shelf.Cleanup.Facts") and
-- this module is what observes each of them: 'candidates' derives the list of
-- files worth looking at from the manifest, 'gatherFacts' looks at one of
-- them, 'planCleanup' does that for all of them with the git probes batched
-- per repository, and 'executeCleanup' acts on a plan.
--
-- Two invariants shape 'executeCleanup'. Every row is re-gathered and
-- re-classified immediately before it is acted on, and a decision that has
-- drifted since the plan aborts the run rather than acting on a stale view of
-- the disk. And every action is written to the log as @pending@ before it
-- happens and @done@ after, so an interrupted run names the file it was in
-- the middle of instead of leaving it to be inferred.
--
-- Nothing is memoised across the plan/execute boundary on purpose: a cached
-- mirror digest would be exactly the observation the drift check exists to
-- repeat.
module Shelf.Cleanup
  ( ProvSet
  , defaultProvSet
  , provenanceKind
  , cleanupLogPath
  , candidates
  , gatherFacts
  , planCleanup
  , executeCleanup
  ) where

import Control.Monad (filterM)
import Data.List (find, isPrefixOf)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.Either (fromRight)
import Data.Maybe (fromMaybe, isJust)
import Data.Set (Set)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (getCurrentTime)
import Data.Time.Format.ISO8601 (iso8601Show)
import System.Directory (canonicalizePath, removeFile)
import System.Exit (ExitCode (..))
import System.FilePath (isAbsolute, normalise, splitDirectories, takeDirectory, (</>))
import System.IO (hPutStrLn, stderr)
import System.IO.Error (tryIOError)
import System.Posix.Files
  ( FileStatus, deviceID, fileID, fileSize, getFileStatus, getSymbolicLinkStatus
  , isRegularFile, isSymbolicLink )

import Shelf.Apply.Paths (RepoPaths (..))
import Shelf.Cleanup.Facts
import Shelf.Cleanup.Git (batchProbe, gitRm, isShelfRemote, repoTop)
import Shelf.Cleanup.Log
import Shelf.Manifest (Manifest (..))
import Shelf.Remote (headObject, renderRemoteError, sha256OfFile)
import Shelf.Remote.Config (RemoteConfig)
import Shelf.Types

-- | Provenance kinds a source may be deleted under. The default is the
-- decision of O-B: only the arXiv sources, the ones with a re-download path
-- that does not depend on the remote, are in scope for cleanup.
type ProvSet = Set Text

defaultProvSet :: ProvSet
defaultProvSet = S.singleton "arxiv"

provenanceKind :: Provenance -> Text
provenanceKind = \case
  ArXiv _ -> "arxiv"
  Doi _ -> "doi"
  Isbn _ -> "isbn"
  Unsourced -> "unsourced"

cleanupLogPath :: RepoPaths -> FilePath
cleanupLogPath rp = takeDirectory (rpManifest rp) </> "cleanup-log.yaml"

-- | Every origin the manifest remembers, resolved against @home@ and
-- deduplicated by path — an origin recorded twice, or shared by two sources,
-- is one candidate. The second component is what was refused before any file
-- was looked at: an origin inside a @.git@ directory (git's own object store
-- is never a duplicate PDF) and an origin that does not land under @home@
-- (the mirror-protection conjuncts are stated in terms of this machine's
-- home, so a path outside it is not something this pass can reason about).
candidates :: Manifest -> FilePath -> ([(FilePath, Source)], [(FilePath, SkipReason)])
candidates mf home = (reverse keeps, reverse skips)
  where
    (_, keeps, skips) = foldl step (S.empty, [], []) resolved
    resolved = [(resolve o, s) | s <- mfSources mf, o <- srcOrigin s]
    resolve o = normalise (if isAbsolute o then o else home </> o)
    step acc@(seen, ks, ss) (p, s)
      | p `S.member` seen = acc
      | ".git" `elem` splitDirectories p = (S.insert p seen, ks, (p, GitInternal) : ss)
      | not (splitDirectories home `isPrefixOf` splitDirectories p) =
          (S.insert p seen, ks, (p, UnresolvableBase) : ss)
      | otherwise = (S.insert p seen, (p, s) : ks, ss)

-- | Observe one candidate, running its git probe on its own. 'planCleanup'
-- batches those probes per repository instead; this is the shape
-- 'executeCleanup' needs, where a single row is re-observed in isolation.
gatherFacts :: RepoPaths -> Manifest -> Maybe RemoteConfig -> ProvSet -> Bool -> FilePath -> Source -> IO Facts
gatherFacts rp mf cfg provs live path src = do
  git <- repoTop (takeDirectory path) >>= \case
    Nothing -> pure NotInRepo
    Just top -> M.findWithDefault (UntrackedOrIgnored top) path <$> batchProbe top [path]
  factsWith rp mf cfg provs live git path src

-- | The observation itself, given a git verdict someone else obtained. The
-- authoritative source is the one whose digest the file actually has, not the
-- one whose origin list named it: a stale origin pointing at a different
-- paper must be judged as that other paper, or not at all.
factsWith :: RepoPaths -> Manifest -> Maybe RemoteConfig -> ProvSet -> Bool -> GitFacts -> FilePath -> Source -> IO Facts
factsWith rp mf cfg provs live git path src = do
  root <- canonicalOrSelf (rpRoot rp)
  canon <- canonicalOrSelf path
  link <- statOf getSymbolicLinkStatus path
  self <- statOf getFileStatus path
  let symlink = maybe False isSymbolicLink link
      regular = maybe False isRegularFile self
      size = maybe (-1) (fromIntegral . fileSize) self
      sizes = S.fromList (map srcBytes (mfSources mf))
  hash <- if regular && not symlink && size `S.member` sizes
    then Just <$> sha256OfFile path
    else pure Nothing
  let matched = hash >>= \h -> find ((== h) . srcSha256) (mfSources mf)
      subject = fromMaybe src matched
      mirror = rpPdfs rp </> T.unpack (citekeyText (srcCitekey subject)) <> ".pdf"
  mirrorStat <- statOf getFileStatus mirror
  mirrorHash <- maybe (pure Nothing) (const (Just <$> sha256OfFile mirror)) mirrorStat
  otherShelf <- maybe (pure False) isShelfRemote (gitTop git)
  liveness <- liveCheck live cfg subject
  pure Facts
    { fPath = path
    , fInShelfCheckout = splitDirectories root `isPrefixOf` splitDirectories canon
    , fSameInodeAsMirror = sameFile self mirrorStat
    , fIsRegular = regular
    , fIsSymlink = symlink
    , fSha = if isJust matched then hash else Nothing
    , fSource = matched
    , fRemoteBacked = isRemoteBacked subject
    , fLive = liveness
    , fMirrorMatches = mirrorHash == Just (srcSha256 subject)
    , fUnderOtherShelf = otherShelf
    , fProvenanceAllowed = provenanceKind (srcProvenance subject) `S.member` provs
    , fGit = git
    }

-- | Conjunct 0's second half: the mirror reached by a second name — a hard
-- link, a bind mount — is the mirror, whatever the manifest calls the path.
sameFile :: Maybe FileStatus -> Maybe FileStatus -> Bool
sameFile (Just a) (Just b) = deviceID a == deviceID b && fileID a == fileID b
sameFile _ _ = False

-- | Conjunct 3's live half: every recorded object must still answer HEAD with
-- the ETag the manifest verified and the length the manifest recorded. A
-- source with no objects passes vacuously and is stopped by 'isRemoteBacked'
-- in the same conjunct.
liveCheck :: Bool -> Maybe RemoteConfig -> Source -> IO LiveCheck
liveCheck False _ _ = pure NotRequired
liveCheck True Nothing _ = pure (Failed "no remote configuration")
liveCheck True (Just cfg) s = go (maybe [] rmObjects (srcRemote s))
  where
    go [] = pure Verified
    go (o : rest) = headObject cfg (roKey o) >>= \case
      Left e -> pure (Failed (roKey o <> ": " <> renderRemoteError e))
      Right (etag, len)
        | etag /= roEtag o -> pure (Failed (roKey o <> ": etag " <> etag <> " != " <> roEtag o))
        | len /= srcBytes s -> pure (Failed (roKey o <> ": length " <> tshow len <> " != " <> tshow (srcBytes s)))
        | otherwise -> go rest

-- | The dry-run table. Candidates that no longer exist are dropped silently —
-- a manifest origin is a memory of where a file was, not a promise.
planCleanup :: RepoPaths -> FilePath -> Manifest -> Maybe RemoteConfig -> ProvSet -> [FilePath] -> Bool -> IO [(Facts, Decision)]
planCleanup rp home mf cfg provs allowed live = do
  let (wanted, _) = candidates mf home
  present <- filterM (fmap isJust . statOf getSymbolicLinkStatus . fst) wanted
  tops <- mapM (\(p, _) -> (,) p <$> repoTop (takeDirectory p)) present
  probes <- M.unions <$> mapM (uncurry batchProbe) (M.toList (groupTops tops))
  canonical <- mapM canonicalOrSelf allowed
  rows <- mapM (\(p, s) -> factsWith rp mf cfg provs live (M.findWithDefault NotInRepo p probes) p s) present
  pure [(f, classify canonical f) | f <- rows]

groupTops :: [(FilePath, Maybe FilePath)] -> Map FilePath [FilePath]
groupTops tops = M.fromListWith (flip (<>)) [(top, [p]) | (p, Just top) <- tops]

-- | Act on a plan. @regather@ is 'gatherFacts' partially applied by the
-- caller; taking it as an argument is what lets a test drive drift. Deletes
-- happen as they are reached, while the @git rm@ rows are held back and run
-- one batch per repository — after every one of their @pending@ events is on
-- disk, so a failure inside the batch is fully recorded.
executeCleanup :: RepoPaths -> FilePath -> (FilePath -> Source -> IO Facts) -> [FilePath] -> [(Facts, Decision)] -> IO ExitCode
executeCleanup rp home regather allowed plan = do
  canonical <- mapM canonicalOrSelf allowed
  go canonical [] [row | row@(_, d) <- plan, isAction d]
  where
    logPath = cleanupLogPath rp
    go _ staged [] = flush staged >> pure ExitSuccess
    go canonical staged ((f, d) : rest) = case fSource f of
      Nothing -> drift f d (Skip ShaUnknown)
      Just src -> do
        f' <- regather (fPath f) src
        let d' = classify canonical f'
        case (d' == d, fSha f', fSource f') of
          (True, Just hash, Just subject) -> do
            event <- pending home f' hash subject d
            appendEvent logPath event
            case d of
              Delete -> removeFile (fPath f') >> markDone event >> go canonical staged rest
              GitRm top -> go canonical ((top, (fPath f', event)) : staged) rest
              Skip _ -> go canonical staged rest
          _ -> drift f d d'
    flush staged = mapM_ batch (M.toList (M.fromListWith (flip (<>)) [(top, [row]) | (top, row) <- reverse staged]))
    batch (top, rows) = gitRm top (map fst rows) >> mapM_ (markDone . snd) rows
    markDone event = do
      now <- getCurrentTime
      appendEvent logPath event { leStatus = "done", leAt = now }
    drift f planned found = do
      hPutStrLn stderr $ unwords
        [ "cleanup aborted:", fPath f, "was planned as", T.unpack (renderDecision planned)
        , "but now classifies as", T.unpack (renderDecision found) <> ";"
        , "nothing further was done" ]
      pure (ExitFailure 2)

pending :: FilePath -> Facts -> Sha256 -> Source -> Decision -> IO LogEvent
pending home f hash subject decision = do
  now <- getCurrentTime
  let rel = homeRelative home (fPath f)
  pure LogEvent
    { leKey = T.pack rel <> "|" <> T.pack (iso8601Show now)
    , lePath = rel
    , leSha = hash
    , leCitekey = srcCitekey subject
    , leAction = case decision of GitRm _ -> "git-rm"; _ -> "delete"
    , leRepo = case decision of GitRm top -> Just (homeRelative home top); _ -> Nothing
    , leObjects = [roKey o | o <- maybe [] rmObjects (srcRemote subject)]
    , leStatus = "pending"
    , leAt = now
    }

canonicalOrSelf :: FilePath -> IO FilePath
canonicalOrSelf p = fromRight p <$> tryIOError (canonicalizePath p)

statOf :: (FilePath -> IO FileStatus) -> FilePath -> IO (Maybe FileStatus)
statOf how p = either (const Nothing) Just <$> tryIOError (how p)

tshow :: Show a => a -> Text
tshow = T.pack . show
