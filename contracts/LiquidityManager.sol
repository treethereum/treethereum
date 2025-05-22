// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IUniswapRouter {
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
}

interface ITETHBasic {
    function approve(address spender, uint256 amount) external returns (bool);
}

contract LiquidityManager {
    address public immutable token;
    address public immutable router;
    address public immutable treasury;

    uint256 public lastAdd;
    uint256 public totalAdded;

    uint256 public constant MAX_ACTIVE_LP = 25_000_000 * 1e18;
    uint256 public constant TOKEN_PER_ADD = 100_000 * 1e18;
    uint256 public constant ETH_PER_ADD = 0.1 ether;
    uint256 public constant INTERVAL = 14 days;

    constructor(address _token, address _router, address _treasury) {
        token = _token;
        router = _router;
        treasury = _treasury;
        lastAdd = block.timestamp - INTERVAL; // allow immediate first add
    }

    function addLiquidity() external {
        require(address(this).balance >= ETH_PER_ADD, "Not enough ETH");
        require(block.timestamp >= lastAdd + INTERVAL, "Wait for cooldown");
        require(totalAdded + TOKEN_PER_ADD <= MAX_ACTIVE_LP, "Max LP cap reached");

        ITETHBasic(token).approve(router, TOKEN_PER_ADD);

        IUniswapRouter(router).addLiquidityETH{value: ETH_PER_ADD}(
            token,
            TOKEN_PER_ADD,
            0,
            0,
            treasury,
            block.timestamp
        );

        totalAdded += TOKEN_PER_ADD;
        lastAdd = block.timestamp;
    }

    receive() external payable {}
}
