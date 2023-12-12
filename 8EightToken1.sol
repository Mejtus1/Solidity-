// notes for 8EightToken 

// 1. create email 
// 2. generate images for twitter and logo
// 3. create twitter
// 4. create tg ()
// 5. create website
// 6. compile and create contract 
// 7. publish source code
// 8. provide liquidity 

buying tokens is shown in token address and transfers fees to contract address and other 
0xe2e03346f72a98f512eaaf3c334146fb846845df78e3ceb403aededb1333334f Execute 14 mins ago 0x9C7a25...30Ef8544 0x5C56f6...0340BE2a 624,588,398.566678014
0xe2e03346f72a98f512eaaf3c334146fb846845df78e3ceb403aededb1333334f Execute 14 mins ago 0x9C7a25...30Ef8544 0x06A8dF...4C20fe60 127,927,744.284741279 (fees to contract)
0x3521f231833dab9ee4c35b2db21c0cfa899a250b0cb5addc90ad587ecee6ac0f Execute 43 secs ago 0x9C7a25...30Ef8544 0x5C56f6...0340BE2a 520,750,707.492644667 
0x3521f231833dab9ee4c35b2db21c0cfa899a250b0cb5addc90ad587ecee6ac0f Execute 43 secs ago 0x9C7a25...30Ef8544 0x06A8dF...4C20fe60 106,659,783.462348907 (fees to contract)



// --------------------------------------------------------------------------------------------------------
// 6. 
// Remix IDE - deploy and run transactions 
// ENVIRONENT - injected provider metamask
// account = metamask account address
/* Contract *Context - 8EightToken.sol 
            *EightToken - 8EightToken.sol 
            *IERC20 - 8EightToken.sol
            *IUniswapV2Factory - 8EightToken.sol
            *IUniswapV2Router - 8EightToken.sol 
            *Ownable - 8EightToken.sol
            *SafeMath - 8EightToken.sol*/
// we need to choose EightToken - 8EightToken.sol to deploy 
// token contract gets deployed and gets its own address 
// --------------------------------------------------------------------------------------------------------


// 7. 
// --------------------------------------------------------------------------------------------------------
// Verify and publish contract source code
// - in unverified case (on etherscan) we can see only hexadecimal notation 
/*
Token contract -> Token code -> contract -> verify and publish token contract 

Please enter the Contract Address you would like to verify
** select contract address **
Please select Compiler Type
** Solidity ** (our code is single file)
Please select compiler version 
** select compiler version (with which we compiled our contract in remix)
Please select Open Source License Type
** select license (MIT or Unlicensed)

Enter the Solidity Contract Code below
** copy and paste your code below ** 

Etherscan validates and verifies it, which leads to code being published on etherscan */
// --------------------------------------------------------------------------------------------------------


// --------------------------------------------------------------------------------------------------------
// CONTRACT FUNCTIONS 
// 1. READ CONTRACT funtions 
// 2. WRITE CONTRACT functions 

// READ CONTRACT functions
_maxTaxSwap
100000000000000000 uint256

_maxTxAmount
200000000000000000 uint256

_maxWalletSize
200000000000000000 uint256

_taxSwapThreshold
100000000000000000 uint256

_allowance
owner (address)
   owner (address)
spender (address)
   spender (address)

balanceOf
account (address)
   account (address)

cooldownTimerInterval 
uint8

decimals 
uint8

isBot
(address)

name 
8EightToken

owner 

Symbol
8TKN 

totalSuppy
10000000000000000000 uint256

transferDelayEnabled 
true(bool)

// 2. WRITE CONTRACT functions 
addbots
bots_ (address[])

approve
spender (address)
  spender (address)
amount (uint256)
  amount (uint256)

delBots
notbot (address[])

manualSwap

openTrading

reduceFee 
_newFee (uint256)

removeLimits

renounceOwnership

transfer
recipient (address)
  recipient (address)
amount (uint256)
  amount (uint256)

transferFrom 
sender (address)
  sender (address)
recipient (address)
  recipient (address)
amount (uint256)
  amount (uint256)
// --------------------------------------------------------------------------------------------------------


// 8. 
// --------------------------------------------------------------------------------------------------------
transfer 10 bilion tokens from 0x00 to contract 
         10 000 000 000
10 bilion tokens 
8,3 bilion provided into uniswap pool for 1 eth 


Add liquidity 
Choose pair: 
ETH / Token contract we want to create liquidity for 
fees: 
0,30% (not sure what is this for)
Set up price range:
(price range can be set up for fees and maximum minumum price)
- typical uniswap algorithm is used for full range price range 
set price range: FULL RANGE 
low price = 0 
high price = ∞ 

price per eth: 8 300 000 000 (8,3 bilion)
Deposit amounts (should be set up automatically after inputting ether value)

in the pools section on uniswap we can see our token pool when we connect our creator wallet, 
- in order to swich metamask wallets, you need to change THEM IN METAMASK EXTENSION not on website

// --------------------------------------------------------------------------------------------------------

