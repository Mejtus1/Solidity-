/* ETH COIN CREATION 
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
-------------------------------------------------------------
1. https://docs.openzeppelin.com/contracts/4.x/wizard (ethereum token creation wizard)
2. https://remix.ethereum.org (Solidity Code Online Compiler)
- insert code inside remix IDE 
- check Solidity version on code and on Remix IDE compiler 
- change name and ticker symbol 
- change number of tokens 
- compile
- deploy
*/
// First token on etherscan
// https://sepolia.etherscan.io/address/0xc029f483bd789ed8041d48c440910b9ec5b82e28


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; //Token ownership = set up Owner, creator 

contract FirstToken is ERC20, Ownable {
    constructor(address initialOwner) 
        ERC20("FirstToken", "FTK")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 6969696969 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

 


/*
[vm]from: 0x5B3...eddC4to: FirstToken.(constructor)value: 0 weidata: 0x608...90e11logs: 2hash: 0xf33...2458b
status	true Transaction mined and execution succeed
transaction hash	0xf33a17a1ad8e75b75a4cc19f63ad7a5a64f9708d09ce0dcbda95134e65e2458b
block hash	0xa1275232ceb2fe05f5ac42515816cafb9607bf44122159cc1f884a424edeae51
block number	1
contract address	0xd9145CCE52D386f254917e481eB44e9943F39138
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	FirstToken.(constructor)
gas	1337417 gas
transaction cost	1163439 gas 
execution cost	999183 gas 
input	0x608...90e11
decoded input	{
	"address initialOwner": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
}
decoded output	 - 
logs	[
	{
		"from": "0xd9145CCE52D386f254917e481eB44e9943F39138",
		"topic": "0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0",
		"event": "OwnershipTransferred",
		"args": {
			"0": "0x0000000000000000000000000000000000000000",
			"1": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11",
			"previousOwner": "0x0000000000000000000000000000000000000000",
			"newOwner": "0x19d8C9E15Ecf8f4E22F99337b0172d55FBD90E11"
		}
	},
	{
		"from": "0xd9145CCE52D386f254917e481eB44e9943F39138",
		"topic": "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef",
		"event": "Transfer",
		"args": {
			"0": "0x0000000000000000000000000000000000000000",
			"1": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"2": "69696969000000000000000000",
			"from": "0x0000000000000000000000000000000000000000",
			"to": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"value": "69696969000000000000000000"
		}
	}
]
val	0 wei