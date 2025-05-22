# Treethereum

Treethereum is a purpose-driven blockchain project designed to unlock long-term environmental and community value through transparent tokenomics, gradual liquidity rollout, and decentralized governance.

---

## 🌱 Project Overview

- **Token Symbol:** TETH  
- **Total Supply:** 100,000,000 (fixed)  
- **Launch Date:** 5/19/2025  
- **Slogan:** Do Good, Hold TETH.

Treethereum balances sustainable growth with responsible fund distribution by locking, vesting, and controlling all major token flows through smart contracts.

---

## 🔐 Core Contracts

| Contract                    | Description                                                  |
|-----------------------------|--------------------------------------------------------------|
| `TreethereumToken.sol`      | ERC20 token with minting restricted to staking contract      |
| `StakingContract.sol`       | Manual claim staking with 20% APR                            |
| `FoundersVestingVault.sol`  | 20M TETH released over 10 years to the Treasury Safe         |
| `GovernanceVestingVault.sol`| 50M TETH released over 25 years to the Governance Safe       |
| `LiquidityManager.sol`      | Releases 18M TETH in timed 100K + 0.1 ETH LP intervals        |
| `TreethereumDAO.sol`        | Placeholder for future DAO governance                        |

---

## 📂 Project Structure

- `/contracts` – All Solidity source files
- `/deployment` – Deployment config and constructor arguments
- `/docs` – Tokenomics, Architecture, Launch Plan, Reserve Policy
- `/dao` – Governance model and DAO planning

---

## 📄 Documentation Highlights

- `DeploymentConfig.md` – Launch sequence and constructor setup
- `Tokenomics.md` – Supply breakdown and release mechanics
- `LaunchStrategy.md` – Manual and contract-based LP rollout
- `ReservePolicy.md` – 5M TETH reserve use and governance intent
- `Architecture.md` – Wallet flow and contract ownership logic

---

## 🔮 Governance Path

Treethereum begins with multisig-controlled Gnosis Safes for both Treasury and Governance. A DAO framework is planned for future migration, allowing token holders to vote on reserve use, funding proposals, and protocol changes.

---

## 🤝 Contributing

This repository is maintained by the core team. Contributions may be opened post-launch depending on future governance and project structure.

