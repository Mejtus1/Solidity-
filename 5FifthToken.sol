// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.0/access/AccessControl.sol"; //Privileged accounts will be able to create more supply
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20Permit.sol"; //Without paying gas, token holders will be able to allow third parties to transfer from their account.

contract FifthToken is ERC20, AccessControl, ERC20Permit { //added ERC20Permit
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address defaultAdmin, address minter)
        ERC20("FifthToken", "FTK")
        ERC20Permit("FifthToken") 
    {               // added ERC20 Permit
        _mint(msg.sender, 69 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}

// Permit added 

//Token on Etherscan 
// https://sepolia.etherscan.io/address/0x122850689e14bdd88745d957b46e852fc158dfa8






/*
Log: 

[block:4444577 txIndex:13]from: 0x19d...90E11to: FifthToken.(constructor)value: 0 weidata: 0x610...90e11logs: 3hash: 0x6a5...97c1a
status	true Transaction mined and execution succeed
transaction hash	0x9c94e3802bbc84d9d60ced6e855613833b19d993f07639114192b1f6d871f836
block hash	0x6a5cb984c372eebe08aab17cc5eee9a8c4a69d14c6b33413b2679ce475197c1a
block number	4444577
contract address	0x122850689e14BdD88745D957B46e852FC158DfA8
from	0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11
to	FifthToken.(constructor)
gas	2210698 gas
transaction cost	2210698 gas 
input	0x610...90e11
decoded input	{
	"address defaultAdmin": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
	"address minter": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
}
decoded output	 - 
logs	[
	{
		"from": "0x122850689e14BdD88745D957B46e852FC158DfA8",
		"topic": "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef",
		"event": "Transfer",
		"args": {
			"0": "0x0000000000000000000000000000000000000000",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"2": "69000000000000000000",
			"from": "0x0000000000000000000000000000000000000000",
			"to": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"value": "69000000000000000000"
		}
	},
	{
		"from": "0x122850689e14BdD88745D957B46e852FC158DfA8",
		"topic": "0x2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d",
		"event": "RoleGranted",
		"args": {
			"0": "0x0000000000000000000000000000000000000000000000000000000000000000",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"2": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"role": "0x0000000000000000000000000000000000000000000000000000000000000000",
			"account": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"sender": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
		}
	},
	{
		"from": "0x122850689e14BdD88745D957B46e852FC158DfA8",
		"topic": "0x2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d",
		"event": "RoleGranted",
		"args": {
			"0": "0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"2": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"role": "0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6",
			"account": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"sender": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
		}
	}
]
val	0 wei
