# NUM-02 — Pipeline validation: tick -> price reconstruction

**Requirement:** NUM-02 — the data-extraction pipeline's tick->price reconstruction is
cross-checked against the canonical on-chain twin **before** any fit consumes data.
**Plan:** 02-01 (Phase 2, Wave 0). **Date:** 2026-06-13.

This is the pipeline-validation gate that must exist *before* NUM-03/04 ingest on-chain
data (Pitfall 5/8: a fit on a mis-reconstructed price series is worse than no fit). The
**math-parity leg is complete and runnable offline now**; the two data-dependent legs
(decimals scaling, one real `(block, pool, tick, sqrtX96)` triple) are **Wave 1** (they
need a snapshot).

## The on-chain twin

The canonical reconstruction is `clamm-automaton/src/PriceFromTick.sol` `library TickMath`
(Algebra/Uniswap-V3 Q64.96 math): `getSqrtPriceAtTick(tick)` returns
`sqrt(1.0001^tick) * 2^96` as a `uint160`, and `getTickAtSqrtPrice(sqrtPriceX96)` is its
inverse over `[MIN_SQRT_PRICE, MAX_SQRT_PRICE)`.

## The 5-step reconstruction spec

1. **tick -> sqrtPriceX96.** `sqrtPriceX96 = floor(sqrt(1.0001^tick) * 2^96)`. Ground
   truth = `TickMath.getSqrtPriceAtTick`. **[Wave 0, validated]** — minted in
   `clamm-automaton/test/TickMathKAT.t.sol`, committed in `NUM-02.kat.json`.

2. **sqrtPriceX96 -> price_raw.** `price_raw (token1/token0) = sqrtPriceX96^2 / 2^192`
   (exact integer arithmetic, single float coercion). **[Wave 0, validated]** — the
   Python reconstruction in `tools/compute/tests/test_tick_price.py` reproduces the
   committed vectors: tick=0 -> exactly 1.0, tick=1 -> 1.0001 (rel-err < 1e-9),
   tick=-887272 -> 2.94e-39.

3. **price_raw -> human_price (decimals).** `human_price = price_raw * 10^(decimals0 -
   decimals1)`. **[Wave 1, DEFERRED]** — requires a concrete pool (its two token
   decimals). Tested against one real Dune row once a pool is named (NUM-01 leg 2).

4. **Round-trip soundness.** `getTickAtSqrtPrice(getSqrtPriceAtTick(t)) == t` for
   `t in {-887272, -100, 0, 1, 100, 887271}`. **[Wave 0, validated]** — the forge KAT
   asserts this. **NB:** `MAX_TICK` (887272) is excluded from the round-trip set:
   `getSqrtPriceAtTick(MAX_TICK) == MAX_SQRT_PRICE`, which `getTickAtSqrtPrice` rejects by
   design (the price can never *reach* the max-tick price), so `887271` is the upper
   round-trippable representative. This is a property of TickMath, not a reconstruction bug.

5. **Event ordering.** Swap/fee events are ordered deterministically by
   `(block_number, log_index)` (the realized `φ_obs` from `algebrapool_evt_fee` is
   forward-filled onto swap blocks by `(block, evt_index)` per Addendum 2).
   **[Wave 1, DEFERRED]** — needs the real extracted event stream; the ordering rule is
   specified here, validated on the snapshot in Wave 1.

## What is proven offline (this plan)

- **forge KAT** (`testTickMathKAT`, `forge test --match-test testTickMathKAT` exits 0):
  - `getSqrtPriceAtTick(0) == 79228162514264337593543950336 == 2^96`;
  - `getSqrtPriceAtTick(-887272) == 4295128739 == MIN_SQRT_PRICE`;
  - round-trip holds on `{-887272, -100, 0, 1, 100, 887271}`.
- **pytest parity** (`tools/compute/tests/test_tick_price.py`, 4 tests pass): the Python
  integer reconstruction loads `NUM-02.kat.json` and reproduces every minted
  `price_raw`, anchored on the `2^96` literal.
- **`NUM-02.kat.json`**: the committed ground-truth vectors, minted from the forge twin
  (not hand-typed beyond the two documented literals `2^96` and `MIN_SQRT_PRICE`).

The math leg is therefore a non-forgeable parity gate: the Python price reconstruction is
byte-for-byte consistent (integer `sqrtPriceX96`) and float-tolerant (`price_raw`) with
the canonical Solidity TickMath. No on-chain data was needed or consumed.

## Build / re-run note

`clamm-automaton` carries two pre-existing, prior-track scaffold files that broke the
shared Foundry compile independently of this work: `src/Counter.sol` (a stray brace) and
`test/Counter.t.sol` (references a `Log2.sol` method that was since removed). The brace in
`src/Counter.sol` was repaired (Rule 3 unblock — a one-token syntax fix, no behavior
change). `test/Counter.t.sol` is a deeper prior-track break left untouched (out of scope);
run the KAT in isolation with `forge test --match-test testTickMathKAT` after relocating
that broken test, or repair it under the network-flows study track separately. The break
is logged in the phase `deferred-items.md`.
