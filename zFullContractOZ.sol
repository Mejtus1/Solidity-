// Whole contract
// This contract includes a cap on total supply, minting, burning, and transferring tokens

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 private _cap;

    constructor(string memory name, string memory symbol, uint256 cap, uint256 initialSupply) ERC20(name, symbol) {
        require(cap > 0, "Cap must be greater than 0");
        _cap = cap;
        _mint(msg.sender, initialSupply);
    }

    modifier hasMintPermission() {
        require(totalSupply() < _cap, "Token cap reached");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner hasMintPermission {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(balanceOf(from) >= amount, "Insufficient balance");
        return super.transferFrom(from, to, amount);
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        return super.increaseAllowance(spender, addedValue);
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        return super.decreaseAllowance(spender, subtractedValue);
    }

    function cap() public view returns (uint256) {
        return _cap;
    }
}
// ------------------------------------------------------------------------------------------------

// Cap on Total Supply:
// - _cap variable is introduced to limit total supply of tokens
// - cap is set during contract deployment

// - constructor sets initial parameters, including name, symbol, cap, and initial supply
// - contract inherits from OpenZeppelin ERC20 and Ownable contracts

// Minting Functionality:
// -  mint function allows contract owner to create and send new tokens to specified address
// - onlyOwner modifier ensures that only contract owner can mint tokens
// - hasMintPermission modifier checks if cap has been reached before allowing minting

// Burning Functionality:
// burn function allows any token holder to burn (destroy) their own tokens, reducing total supply

// Transferring Tokens:
// - transfer and transferFrom functions are overridden to provide custom validation that checks 
// if sender has sufficient balance before initiating transfer
// - ensures that transfers do not exceed sender's available balance

// Adjusting Allowances:
// - increaseAllowance and decreaseAllowance functions allow token holders to adjust theallowances for spender addresses
// These functions are provided by OpenZeppelin ERC20 contract

// cap() Function:
// - cap() function is public view function that allows anyone to check token's cap
