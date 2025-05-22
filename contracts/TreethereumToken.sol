// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TreethereumToken is ERC20, Ownable {
    uint256 public stakingRate;
    address public stakingContract;

    constructor(
        address treasurySafe,
        address governanceSafe,
        uint256 initialStakingRate
    ) ERC20("treethereum", "TETH") Ownable(treasurySafe) {
        uint256 initialSupply = 100_000_000 * 10 ** decimals();
        uint256 half = initialSupply / 2;
        _mint(treasurySafe, half);
        _mint(governanceSafe, half);
        stakingRate = initialStakingRate;
    }

    function setStakingContract(address _stakingContract) external onlyOwner {
        stakingContract = _stakingContract;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == stakingContract, "Unauthorized");
        _mint(to, amount);
    }

    function setStakingRate(uint256 newRate) external onlyOwner {
        stakingRate = newRate;
    }
}
