// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20Burnable.sol"; //Token holders will be able to destroy their tokens.
import "@openzeppelin/contracts@5.0.0/access/AccessControl.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20Permit.sol"; //Without paying gas, token holders will be able to allow third parties to transfer from their account.
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20Votes.sol"; //Keeps track of historical balances for voting in on-chain governance, with a way to delegate one's voting power to a trusted account.
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20FlashMint.sol"; //Built-in flash loans. Lend tokens without requiring collateral as long as they're returned in the same transaction.

contract SixthToken is ERC20, ERC20Burnable, AccessControl, ERC20Permit, ERC20Votes, ERC20FlashMint {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address defaultAdmin, address minter)
        ERC20("SixthToken", "STK")
        ERC20Permit("FifthToken")
    {
        _mint(msg.sender, 69 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}


// oken on etherscan
// https://sepolia.etherscan.io/address/0x0d4e1b6b6fc7121a3a3d1c21922f59c4421aab69

/* 
[vm]from: 0x5B3...eddC4to: SixthToken.(constructor)value: 0 weidata: 0x610...90e11logs: 3hash: 0x606...ca709
status	true Transaction mined and execution succeed
transaction hash	0x606b997be85ceada4b169578ce1c3ec93fc655591fb621597fec5793c22ca709
block hash	0xc5e8641aa627fdce0868a65fc2408582519ad44f429afc33a5d0ed78f71882ee
block number	2
contract address	0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	SixthToken.(constructor)
gas	4846773 gas
transaction cost	4216179 gas 
execution cost	3780389 gas 
input	0x610...90e11
decoded input	{
	"address defaultAdmin": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
	"address minter": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
}
decoded output	 - 
logs	[
	{
		"from": "0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8",
		"topic": "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef",
		"event": "Transfer",
		"args": {
			"0": "0x0000000000000000000000000000000000000000",
			"1": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"2": "69000000000000000000",
			"from": "0x0000000000000000000000000000000000000000",
			"to": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"value": "69000000000000000000"
		}
	},
	{
		"from": "0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8",
		"topic": "0x2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d",
		"event": "RoleGranted",
		"args": {
			"0": "0x0000000000000000000000000000000000000000000000000000000000000000",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"2": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"role": "0x0000000000000000000000000000000000000000000000000000000000000000",
			"account": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
		}
	},
	{
		"from": "0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8",
		"topic": "0x2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d",
		"event": "RoleGranted",
		"args": {
			"0": "0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"2": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"role": "0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6",
			"account": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
		}
	}
]
val	0 wei
creation of SixthToken pending...