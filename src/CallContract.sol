// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;  

contract CallContract {
    uint256 public kek = 0;
    uint256 public x;
    bool public y;
    uint256 public amountFunded;

    function returnXandY(uint256 _x, bool _y) external returns (uint256, bool) {
        x = _x;
        y = _y;

        return (x+2,!y);
    }

    function getTestEth() payable external {
        amountFunded += msg.value;
    }

    receive() external payable {}

    fallback() external payable {
        kek+=1;
    }
}