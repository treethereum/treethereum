# Treethereum Contract Architecture

This document outlines the structure and relationships between Treethereum’s smart contracts, governance roles, and token flow.

---

## Core Roles

- **Treasury Gnosis Safe**
  - Owns all contracts (token, staking, liquidity)
  - Distributes marketing/ops funds (5M TETH)
  - Manages ETH funding for LP contract

- **Governance Gnosis Safe**
  - Receives 2M/year from GovernanceVestingVault (total 50M)
  - Future DAO will replace this control structure

- **Reserve Gnosis Safe**
  - Holds 5M TETH (off-contract reserve for LP/partnership/DAO use)
  - No contracts pull from this directly

- **Alex & Ed (Ledger wallets)**
  - Signers on Treasury and Reserve multisigs

---

## Contract Map

| Contract                  | Purpose                                                     |
|---------------------------|-------------------------------------------------------------|
| `TreethereumToken`        | Core ERC20 token, minting delegated to staking contract     |
| `StakingContract`         | Tracks deposits and issues rewards; calls `mint()`          |
| `FoundersVestingVault`    | Releases 2M/year to Treasury from locked 20M TETH           |
| `GovernanceVestingVault`  | Releases 2M/year to Governance from locked 50M TETH         |
| `LiquidityManager`        | Releases 18M TETH total over 3.8 years in timed LP chunks   |
| `TreethereumDAO` *(future)* | Placeholder for full decentralized governance             |

---

## Control Flow Summary

- **Ownership & Logic Control:**  
  - Treasury Gnosis Safe owns all deployed contracts  
  - Only Treasury Safe can change staking contract or claim vesting funds  
  - Treasury Safe funds LiquidityManager periodically with ETH

- **Manual LP Launch:**  
  - 2M TETH + 2 ETH paired manually at launch (outside contract logic)

- **Automated LP Rollout:**  
  - 18M TETH stored in LiquidityManager  
  - Adds 100K TETH + 0.1 ETH every 14 days (ETH must be preloaded)

- **Locked Reserves:**  
  - 5M TETH held in dedicated Reserve Safe  
  - Not accessible without multisig/DAO decision  
  - Not visible in LiquidityManager contract balance

- **Founders & Governance Funds:**  
  - Both locked in separate vesting contracts  
  - Anyone can call `claim()`, but tokens go only to their assigned Gnosis Safe

---

## Upgrade & DAO Plan

- DAO contract will be implemented later using Snapshot or OpenZeppelin Governor
- DAO will assume control over:
  - Treasury actions
  - Liquidity schedule changes
  - Governance fund use
  - Reserve fund allocation
