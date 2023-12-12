pragma solidity ^0.8.0;

// Contract imported from openzeppelin cannot be verified on etherscan 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NinthToken is ERC20 {

    constructor (uint256 initialSupply) ERC20("NinthToken", "SHT") {
        _mint(msg.sender, initialSupply);
    }

}