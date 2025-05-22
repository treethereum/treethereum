// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface ITreethereumToken {
    function mint(address to, uint256 amount) external;
    function stakingRate() external view returns (uint256);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract StakingContract {
    ITreethereumToken public immutable teth;
    address public immutable owner;

    struct StakeInfo {
        uint256 amount;
        uint256 lastClaimed;
        uint256 lastUnstake;
    }

    mapping(address => StakeInfo) public stakes;

    bool public paused = false;
    uint256 public cooldown = 1 hours;
    uint256 public maxStakePerUser = 1_000_000 * 1e18;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier notPaused() {
        require(!paused, "Staking is paused");
        _;
    }

    constructor(address _teth) {
        teth = ITreethereumToken(_teth);
        owner = msg.sender;
    }

    function stake(uint256 amount) external notPaused {
        require(amount > 0, "Cannot stake 0");

        if (stakes[msg.sender].amount > 0) {
            claim();
        }

        require(teth.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        stakes[msg.sender].amount += amount;
        stakes[msg.sender].lastClaimed = block.timestamp;

        require(stakes[msg.sender].amount <= maxStakePerUser, "Stake exceeds max allowed");
    }

    function claim() public notPaused {
        StakeInfo storage info = stakes[msg.sender];
        require(info.amount > 0, "No stake");

        uint256 reward = (info.amount * teth.stakingRate() * (block.timestamp - info.lastClaimed)) / 1e18;
        info.lastClaimed = block.timestamp;

        teth.mint(msg.sender, reward);
    }

    function unstake() external notPaused {
        StakeInfo storage info = stakes[msg.sender];
        require(info.amount > 0, "Nothing to unstake");
        require(block.timestamp >= info.lastUnstake + cooldown, "Unstake cooldown active");

        claim();
        uint256 amount = info.amount;
        info.amount = 0;
        info.lastClaimed = 0;
        info.lastUnstake = block.timestamp;

        require(teth.transfer(msg.sender, amount), "Unstake failed");
    }

    function viewRewards(address user) external view returns (uint256) {
        StakeInfo memory info = stakes[user];
        if (info.amount == 0) return 0;

        return (info.amount * teth.stakingRate() * (block.timestamp - info.lastClaimed)) / 1e18;
    }

    // Admin controls
    function pause(bool _paused) external onlyOwner {
        paused = _paused;
    }

    function setCooldown(uint256 _cooldown) external onlyOwner {
        cooldown = _cooldown;
    }

    function setMaxStakePerUser(uint256 _max) external onlyOwner {
        maxStakePerUser = _max;
    }
}
