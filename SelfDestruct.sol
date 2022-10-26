//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract StartStopUpdate {
    
    receive() external payable {}

    function destroyContract() public {
        selfdestruct(payable(msg.sender));
    }
    
}
