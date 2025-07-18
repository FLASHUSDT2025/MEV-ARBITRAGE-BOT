// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashloanArbitrage {
    address public owner;
    IUniswapV2Router02 public router;

    constructor(address _router) {
        owner = msg.sender;
        router = IUniswapV2Router02(_router);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function executeArbitrage(
        address tokenA,
        address tokenB,
        uint amount
    ) external onlyOwner {
        // Approve the router to spend tokenA
        IERC20(tokenA).approve(address(router), amount);

        // ✅ Declare and initialize the swap path
        address ;
        path[0] = tokenA;
        path[1] = tokenB;

        // Swap tokenA → tokenB
        router.swapExactTokensForTokens(
            amount,
            0, // Accept any amount of tokenB
            path,
            address(this),
            block.timestamp
        );

        // Get the balance of tokenB received
        uint tokenBBalance = IERC20(tokenB).balanceOf(address(this));

        // Approve the router to spend tokenB
        IERC20(tokenB).approve(address(router), tokenBBalance);

        // ✅ Reverse the path: tokenB → tokenA
        address[] memory reverse = reversePath(path);

        // Swap tokenB → tokenA
        router.swapExactTokensForTokens(
            tokenBBalance,
            0, // Accept any amount of tokenA
            reverse,
            address(this),
            block.timestamp
        );
    }

    // ✅ Reverse the swap path
    function reversePath(address[] memory path) internal pure returns (address[] memory) {
        require(path.length == 2, "Only 2-token path supported");

        address ;
        reversed[0] = path[1];
        reversed[1] = path[0];

        return reversed;
    }

    // ✅ Withdraw token to owner
    function withdrawToken(address token) external onlyOwner {
        uint balance = IERC20(token).balanceOf(address(this));
        require(balance > 0, "No token balance");
        IERC20(token).transfer(owner, balance);
    }
}
