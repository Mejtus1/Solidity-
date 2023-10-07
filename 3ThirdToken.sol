// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.0/access/AccessControl.sol"; // Privileged accounts will be able to create more supply

contract ThirdToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address defaultAdmin, address minter) ERC20("ThirdToken", "TTK") {
        _mint(msg.sender, 69 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}
 

//CHANGED ACCESS CONTROL TO ROLES 
/* When deploying youn need to input these values 
DEFAULTADMIN:
"0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
MINTER:
"0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"


Token on etherscan
https://sepolia.etherscan.io/address/0xe01280d3acb9fd1302ac2d2d4b0ed17ddf6aae94




----
Log: 

[block:4444262 txIndex:7]from: 0x19d...90E11to: ThirdToken.(constructor)value: 0 weidata: 0x608...90e11logs: 3hash: 0x8ab...6cc9c
status	true Transaction mined and execution succeed
transaction hash	0xd70407bc9116043942f92af48e627c3a0681bc1ec9b68119f5ceaccce8c5d40f
block hash	0x8ab606fa663c9022da4a369df645630855e61cf9d39484e11e2282ee47d6cc9c
block number	4444262
contract address	0xE01280d3aCb9FD1302Ac2D2d4B0eD17ddf6Aae94
from	0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11
to	ThirdToken.(constructor)
gas	1477388 gas
transaction cost	1477388 gas 
input	0x608...90e11
decoded input	{
	"address defaultAdmin": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
	"address minter": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
}
decoded output	 - 
logs	[
	{
		"from": "0xE01280d3aCb9FD1302Ac2D2d4B0eD17ddf6Aae94",
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
		"from": "0xE01280d3aCb9FD1302Ac2D2d4B0eD17ddf6Aae94",
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
		"from": "0xE01280d3aCb9FD1302Ac2D2d4B0eD17ddf6Aae94",
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
