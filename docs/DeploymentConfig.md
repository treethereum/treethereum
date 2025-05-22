# Treethereum Deployment Configuration

## Wallets

| Role                    | Address                                      |
|-------------------------|----------------------------------------------|
| Treasury Gnosis Safe    | 0xFA8f4d168FA9bc407062DB92aD10532A028261c1   |
| Governance Gnosis Safe  | 0x9cb4e6ff81E740B91aA23FF5415ac0A62fB3CA07   |
| Reserve Gnosis Safe     | 0x1A6cB4ec9D71AB93F165FAD90a1768B8bcF982b6   |

---

## Contracts & Deployment Order

1. **Deploy `TreethereumToken.sol`**
   - 100M TETH minted at launch
     - 50M to Treasury Gnosis Safe
     - 50M to Governance Gnosis Safe
   - `stakingRate` set to 6337617563 (~20% APR, linear)
   - Ownership set to Treasury Gnosis Safe

2. **Deploy `StakingContract.sol`**
   - Pass token address to constructor
   - Call `setStakingContract()` from Treasury Safe

3. **Deploy `LiquidityManager.sol`**
   - Controlled by Treasury Safe
   - Funded with 18M TETH (for time-released LP)
   - ETH must be manually preloaded by Treasury Safe
   - Adds liquidity directly to Uniswap using:
     - 100K TETH + 0.1 ETH every 14 days
   - Sends resulting LP tokens to Treasury Safe

4. **Deploy `FoundersVestingVault.sol`**
   - Locks 20M TETH
   - Releases 2M TETH per year to Treasury Gnosis Safe

5. **Deploy `GovernanceVestingVault.sol`**
   - Locks 50M TETH
   - Releases 2M TETH per year to Governance Gnosis Safe
   - Callable by anyone

6. **Manually fund Reserve Gnosis Safe**
   - Send 5M TETH from Treasury Gnosis Safe to a dedicated Reserve Safe
   - This reserve is held manually and not part of any contract logic

7. **Add Ed to Treasury Safe**
   - Finalize 2-of-2 or 2-of-3 multisig for security and shared control

8. **Deploy `TreethereumDAO.sol` (future)**
   - Placeholder for full decentralized governance migration

---

## TreethereumToken.sol Constructor Arguments

- `treasurySafe`: `0xFA8f4d168FA9bc407062DB92aD10532A028261c1`
- `governanceSafe`: `0x9cb4e6ff81E740B91aA23FF5415ac0A62fB3CA07`
- `initialStakingRate`: `200000000000000` // ~20% APR (linear)

---

## Notes

- `LiquidityManager` holds 18M TETH for LP rollout and interacts directly with Uniswap V2 Router
- ETH must be manually sent to the contract to enable each add
- LP tokens are automatically sent to the Treasury Safe
- 5M TETH reserve is held in a separate Gnosis Safe, off-chain, and tracked transparently
- Vaults (Founders and Governance) are fully locked and gated by release schedules
- DAO contract may eventually take control of Treasury and liquidity policy via governance vote
