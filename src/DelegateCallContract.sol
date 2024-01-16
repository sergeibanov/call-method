// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {CallContract} from "./CallContract.sol"; 

contract DelegateCallContract {
    uint256 public kek = 0;
    uint256 public x;
    bool public y;
    uint256 public amountFunded;
    uint256 public delegateCallInt; // it will change only here after calling delegeteCall


    // DO NOT FORGET ABOUT SPACES IN FUNCTION SIGNATURE! 
    function delegeteCall (address addr, uint256 _delegateCallInt) external {
        (bool success, bytes memory data) = addr.delegatecall
        (abi.encodeWithSignature("testDelegateCall(uint256)", _delegateCallInt));
        require(success, "Something went wrong");
    }
}