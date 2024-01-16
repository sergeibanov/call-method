// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {CallContract} from "./CallContract.sol"; 

contract TestCallContract {
    
    
    struct ReturnedData{
        uint256 x;
        bool y;
    }
    ReturnedData [] public arrayOfReturnedData;

    function callTest (address addr, uint256 _x, bool _y) external {
        (bool success, bytes memory _data) = addr.call(abi.encodeWithSignature("returnXandY(uint256,bool)",_x,_y));
        (success, "Error Occured during tx");
        (uint256 _returnedX, bool _returnedY) = abi.decode(_data, (uint256, bool));
        ReturnedData memory returnedData = ReturnedData({x: _returnedX, y:_returnedY});
        arrayOfReturnedData.push(returnedData);
    }

    function callTestEth (address addr) payable external {
        (bool success, bytes memory _data) = addr.call{value: msg.value, gas: 5000}
            (abi.encodeWithSignature("getTestEth()"));
        (success, "Failed TX");
    }

    function callNotExistingFunction (address addr) external {
        (bool success, ) = addr.call(abi.encodeWithSignature("noSuchFunction()", 7));
        require(success, "No such function");
    }

}
