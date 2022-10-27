// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IERC20 {
    function transferFrom(address _from, address _to, uint256 _value)  external returns (bool success);
    function decimals()  external view returns (uint8);
}

contract TokenSale {

    uint public tokenPriceInWei = 1 ether;

    address public tokenOwner;

    IERC20 public token;

    constructor(address _token) {
        tokenOwner = msg.sender;
        token = IERC20(_token);
    }

    function purchaseACoffee() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder);
    }
}
