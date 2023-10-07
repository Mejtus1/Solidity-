//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4; // = version 0.8.4 and up = ^ 

import "@openzeppelin/contracts@4.7.3/token/ERC20/ERC20.sol";

contract SecondToken is ERC20 { 
    constructor() ERC20("SecondToken", "SET") { //"SecondToken" = token name, "SET" = token ticker symbol 
        _mint(msg.sender, 20 * 10 ** decimals());
    }
}
 


/* 
1. Insert code into REMIX.IDE 
2. Compile it (watch out for version)
3. Choose Deploy/Run transactions (left burger bar)
4. Enviroment (metamask) = Injected Provider
5. Deploy
6. View on etherscan
SecondToken Deployed on ETH network 
https://sepolia.etherscan.io/address/0x649f977b9e43e0f135cc672061d0c08c02e09e4d

