// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface ITETH {
    function transfer(address to, uint256 amount) external returns (bool);
}

contract GovernanceVestingVault {
    ITETH public immutable teth;
    address public immutable governanceSafe;
    uint256 public immutable startTime;

    uint256 public constant TOTAL = 50_000_000 * 1e18;
    uint256 public constant ANNUAL_RELEASE = 2_000_000 * 1e18;
    uint256 public constant SECONDS_PER_YEAR = 31_557_600; // 365.25 days
    uint256 public claimed;

    constructor(address _teth, address _governanceSafe) {
        teth = ITETH(_teth);
        governanceSafe = _governanceSafe;
        startTime = block.timestamp;
    }

    function claim() external {
        uint256 vested = getAvailableToClaim();
        require(vested > 0, "Nothing claimable");
        claimed += vested;
        require(teth.transfer(governanceSafe, vested), "Transfer failed");
    }

    function getAvailableToClaim() public view returns (uint256) {
        uint256 yearsElapsed = (block.timestamp - startTime) / SECONDS_PER_YEAR;
        uint256 maxClaimable = yearsElapsed * ANNUAL_RELEASE;
        if (maxClaimable > TOTAL) maxClaimable = TOTAL;
        return maxClaimable > claimed ? maxClaimable - claimed : 0;
    }
}
