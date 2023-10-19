// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}

/*
- simple Ethereum smart contract written in Solidity programming language 
- smart contract is called "SimpleStorage" 
- designed to store and retrieve an unsigned integer (uint) value on the Ethereum blockchain
*/

// License Identifier:
// SPDX-License-Identifier: GPL-3.0 
- specifies the software license for the code

// Version Pragma:
pragma solidity >=0.4.16 <0.9.0; 
- specifies Solidity compiler version that should be used to compile this code
- ensures that code is compatible with the specified Solidity version range

// Contract Definition:
contract SimpleStorage {}
- starts definition of "SimpleStorage" contract

// State Variable:
uint storedData; 
- declares a state variable storedData of type uint (unsigned integer)
- variables are stored on Ethereum blockchain and can be accessed and modified by functions within contract

// set Function:
function set(uint x) public { // begins the definition of the set function
storedData = x; // sets value of storedData state variable to value of x parameter passed to function
} // closes set function.

// get Function:
function get() public view returns (uint) { // defines get function view keyword indicates that this function does not modify state and only reads data
return storedData; // returns value of storedData state variable
} // closes get function
