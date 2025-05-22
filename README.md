# Treethereum

**"Do Good, Hold TETH."**  
Treethereum is a blockchain-based climate initiative that combines real-world carbon credit generation with transparent smart contract infrastructure and DAO-based governance. The project is designed to empower individuals to fund and oversee verified environmental impact using Ethereum-native tools.

---

## 🌱 Project Overview

- **Token Symbol:** TETH  
- **Total Supply:** 100,000,000 (fixed)  
- **Launch Date:** 5/19/2025  
- **Carbon Registry Partner:** Plan Vivo  
- **Slogan:** Do Good, Hold TETH  
- **Website:** [https://treethereum.org](https://treethereum.org)

Treethereum funds real environmental projects, including land-based carbon credit generation on Treethereum-owned property. Governance, staking rewards, and liquidity distribution are controlled entirely by audited smart contracts and community voting.

---

## 🔐 Core Smart Contracts

| Contract | Description |
|----------|-------------|
| `TreethereumToken.sol` | ERC20 token with staking-only minting |
| `StakingContract.sol` | Manual-claim staking contract (20% APR) |
| `LiquidityManager.sol` | Adds 100k TETH + 0.1 ETH to Uniswap every 14 days |
| `FoundersVestingVault.sol` | 10-year unlock (2M/year to Treasury) |
| `GovernanceVestingVault.sol` | 25-year unlock (2M/year to Governance Safe) |
| `TreethereumDAO.sol` | Placeholder for DAO execution upgrade |

---

## 📁 Repository Structure

- `/contracts/` — All verified Solidity contract source files
- `/docs/` — Project documentation: tokenomics, strategy, DAO structure
- `/assets/` — Logo and token info for Trust Wallet indexing

---

## 📄 Documentation

- `Tokenomics.md` — Full TETH allocation, vesting logic, staking emissions
- `DeploymentConfig.md` — Launch sequence and wallet config
- `LaunchStrategy.md` — Manual + automated liquidity provisioning
- `ReservePolicy.md` — Governance rules for the 5M TETH reserve
- `DAOConfig.md` — Community proposal structure, voting models
- `Architecture.md` — Contract ownership and wallet roles

---

## 🧠 Governance Overview

Treethereum uses Snapshot and Gnosis Safe to enforce DAO-led decision-making:

- **Governance Fund (50M TETH):** Only unlocked by Snapshot-approved proposals
- **Treasury Fund (5M TETH):** Used for marketing, operations, and LP fueling
- **Reserve Fund (5M TETH):** Held offline, only usable via DAO vote
- **Vesting Vaults:** Time-locked for transparency and anti-rug guarantees

SafeSnap and full DAO execution are planned for Phase 2.

---

## 🤝 Contributing

This repo is maintained by the Treethereum founding team. Contribution support, issue tracking, and proposal templates will be rolled out as the governance framework matures.

---

## 📜 License

This repository is licensed under the MIT License.
