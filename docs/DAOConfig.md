# DAO Configuration Plan – Treethereum

The Treethereum DAO will serve as the long-term governance mechanism for the protocol. It will control proposals, voting, and fund allocation over time.

---

## DAO Control Scope

Initially, the DAO will control:

- The **Governance Fund** (50M TETH) released via vesting vault
- Approval of major protocol initiatives (e.g., carbon projects, land acquisition)
- Treasury distributions from the governance wallet
- Expansion or adjustment of LiquidityManager or StakingContract parameters

---

## Voting Mechanism (Planned)

The DAO will use a **TETH-based voting model**, likely powered by:

- [ ] Snapshot (off-chain votes, gasless)
- [ ] OpenZeppelin Governor (on-chain voting)
- [ ] Gnosis Safe + Zodiac module (hybrid voting execution)

Quorum, thresholds, and delay periods will be defined closer to DAO activation.

---

## Transition Timeline

| Phase        | Action                                      |
|--------------|---------------------------------------------|
| Phase 1 (Now)| Governance Fund held in vesting contract, claimed to multisig |
| Phase 2      | DAO proposal framework implemented          |
| Phase 3      | Treasury actions gated by DAO vote results  |

---

## Security and Auditing

Before DAO activation, all contracts will undergo:
- Internal testing
- Community review
- Optional third-party audit

DAO parameters (quorum %, voting delay, proposal format) will be announced publicly before launch.

---

## Additional Modules (Future)

- Grant programs
- Project proposal funding rounds
- Carbon initiative prioritization via community vote
