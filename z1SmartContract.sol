pragma solidity 0.4.0; //solidity version developted in 

contract Greeter {
/* Define variable greeting of type string */
string public yourName;;

/* runs when contract is executed */
function Greeter() public {
    yourName = "World";
}

function set(string name)public {
    yourName = name;
}

function hello() constant returns (string) {
    return yourName;
    }
}

//==================================================
pragma solidity ^0.4.0; 

contract Greeter {
string public yourName;
                       // outdated syntax for defining the constructor
constructor() public { // constructor function 
    yourName = "World";
}

function set(string name)public {
    yourName = name;
}
                // need to add visibility (public was added)
function hello() public constant returns (string) {
    return yourName;
    }
}

// compile code, deploy code, --> deployed contracts
// --> 1. set = sets name 
// --> 2. name = calls name variable
// --> 3. hello = calls hello 