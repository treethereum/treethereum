# Treethereum Launch Strategy

This document outlines the phased launch plan for Treethereum (TETH), including initial market access, contract-managed liquidity rollout, and reserve handling.

---

## Phase 1: Manual Liquidity Launch (Day 1)

To initiate trading and establish a base price, the project will manually pair:

- **2,000,000 TETH**
- **2 ETH**

This pairing will be submitted directly to **Uniswap** using a founder-controlled wallet.

### Outcome:
- Initial price: ~0.001 ETH per TETH
- TETH becomes tradable immediately
- Establishes the base price anchor for the project

---

## Phase 2: Contract-Based Liquidity Rollout

After launch, liquidity expansion is managed by the `LiquidityManager` smart contract.

### Contract Behavior

- Holds **18M TETH**
- Adds liquidity every **14 days**, using:
  - **100,000 TETH**
  - **0.1 ETH**
- ETH is **not stored** in the contract
- ETH must be manually preloaded by the Treasury Gnosis Safe
- Anyone can call `addLiquidity()` if:
  - ETH balance ≥ 0.1 ETH
  - 14-day cooldown has passed
  - Less than 18M TETH has been added

### Benefits

- Predictable, transparent LP growth
- Prevents inflation or sudden dilution
- Publicly callable, but securely controlled via ETH gating
- LP tokens are sent to the Treasury Safe

---

## Reserve Liquidity (5M TETH)

An additional **5M TETH** is held in a **separate Reserve Gnosis Safe**.

- It is **not stored in LiquidityManager**
- It is **not accessible by any contract**
- It exists to support:
  - Future DAO-governed liquidity expansions
  - Partner onboarding or institutional pairing
  - Long-term structural flexibility

---

## Summary

| Component         | Detail                                 |
|-------------------|-----------------------------------------|
| Initial LP        | 2M TETH + 2 ETH (manual pairing)        |
| Contract LP Total | 18M TETH + 18 ETH via `LiquidityManager`|
| LP Interval       | Every 14 days                           |
| TETH/ETH Ratio    | Fixed: 100K TETH + 0.1 ETH per interval |
| Reserve LP        | 5M TETH (stored in separate Gnosis Safe)|

---

## Governance Notes

- Manual LP is deployed by founders from their wallet
- Treasury Safe must preload ETH into LiquidityManager
- LP is released automatically, but gated by rules
- DAO migration will eventually allow proposals to control reserve use and modify LP behavior
