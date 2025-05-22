# Treethereum Tokenomics

## Total Supply: 100,000,000 TETH (fixed)

---

## Distribution Breakdown

| Category         | Amount (TETH) | Notes                                                       |
|------------------|----------------|--------------------------------------------------------------|
| Governance Fund  | 50,000,000     | Locked in GovernanceVestingVault (2M/year to Gnosis Safe)   |
| Founders Pool    | 20,000,000     | Locked in FoundersVestingVault (2M/year to Treasury Safe)   |
| Liquidity Pool   | 18,000,000     | Stored in `LiquidityManager` for biweekly LP release        |
| Launch LP        | 2,000,000      | Manually paired with 2 ETH at launch                        |
| Treasury Ops     | 5,000,000      | Held in Treasury Gnosis Safe                                |
| Reserve Pool     | 5,000,000      | Stored in separate Reserve Gnosis Safe (off-contract)       |

---

## Liquidity Strategy

- Managed by `LiquidityManager.sol`
- Starts with manual 2M TETH + 2 ETH launch pair
- LiquidityManager adds:
  - **100,000 TETH**
  - **0.1 ETH**
  - Every 14 days
- ETH must be manually preloaded from Treasury
- LP tokens are sent directly to Treasury Safe

---

## Staking

- APR: **20% (linear, non-compounding)**
- Rewards minted only by `StakingContract`
- Claiming is manual
- Unstaking is instant (no cooldown or slashing)

---

## Vesting

- **FoundersVestingVault**
  - 20M TETH locked
  - 10% released per year (2M annually)
  - Sent to Treasury Gnosis Safe
- **GovernanceVestingVault**
  - 50M TETH locked
  - 2M/year released to Governance Gnosis Safe

---

## Treasury Operations

- 5M TETH held in Treasury Gnosis Safe
- Used for:
  - Community grants
  - Influencer partnerships
  - Contributor rewards
  - Operational flexibility pre-DAO

---

## Reserve Pool

- 5M TETH held in **separate Reserve Gnosis Safe**
- Not in any smart contract
- Will remain untouched unless explicitly released by:
  - DAO proposal
  - Community vote
  - Strategic partner onboarding

---

## Governance

- 50M TETH distributed over time from `GovernanceVestingVault`
- Controlled by Governance Gnosis Safe
- DAO migration (via `TreethereumDAO.sol`) will eventually govern:
  - Treasury spending
  - Reserve deployment
  - Liquidity adjustments
