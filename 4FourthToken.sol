// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol"; // Privileged accounts will be able to pause the functionality marked as whenNotPaused. Useful for emergency response.
import "@openzeppelin/contracts/access/AccessControl.sol"; //Privileged accounts will be able to create more supply

contract FourthToken is ERC20, ERC20Pausable, AccessControl {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE"); //pauser 
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE"); //minter 

                //address for admit, pauser and minter is set here
    constructor(address defaultAdmin, address pauser, address minter) 
        ERC20("FourthToken", "FTK")
    {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin); //granting roles for admin
        _grantRole(PAUSER_ROLE, pauser);              //granting roles for pauser
        _mint(msg.sender, 69 * 10 ** decimals());     //number of tokens
        _grantRole(MINTER_ROLE, minter);              //granting role of minter 
    }

    function pause() public onlyRole(PAUSER_ROLE) { //function to pause
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {  //function to unpause
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {  //function to mint
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}

// Added Pausable !!!

// token on etherscan
// https://sepolia.etherscan.io/address/0xb7822312e498c8bf52bcb044ce8d60b6e59cf32d
 
/* 
DEPLOY
DEFAULTADMIN:
"0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
PAUSER:
"0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
MINTER:
"0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"







/* 
Log: 

[block:4444472 txIndex:6]from: 0x19d...90E11to: FourthToken.(constructor)value: 0 weidata: 0x608...90e11logs: 4hash: 0xa23...06846
status	true Transaction mined and execution succeed
transaction hash	0x67720726db83e306fb0d0cc6263230b6d2b7b62cda08a8409808f438956b5db6
block hash	0xa230f04018d9dc1e6785c18db750f3e3f895d5f04be589d0b20ebfe9f5d06846
block number	4444472
contract address	0xb7822312e498C8BF52bcb044ce8d60b6e59cF32D
from	0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11
to	FourthToken.(constructor)
gas	1649017 gas
transaction cost	1649017 gas 
input	0x608...90e11
decoded input	{
	"address defaultAdmin": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
	"address pauser": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
	"address minter": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
}
decoded output	 - 
logs	[
	{
		"from": "0xb7822312e498C8BF52bcb044ce8d60b6e59cF32D",
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
		"from": "0xb7822312e498C8BF52bcb044ce8d60b6e59cF32D",
		"topic": "0x2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d",
		"event": "RoleGranted",
		"args": {
			"0": "0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"2": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"role": "0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a",
			"account": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"sender": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
		}
	},
	{
		"from": "0xb7822312e498C8BF52bcb044ce8d60b6e59cF32D",
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
		"from": "0xb7822312e498C8BF52bcb044ce8d60b6e59cF32D",
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