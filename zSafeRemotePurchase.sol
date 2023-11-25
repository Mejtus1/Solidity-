// Solidity learn by example from solidity docs
// Safe Remote Purchase
// https://docs.soliditylang.org/en/develop/solidity-by-example.html

// Safe Remote Purchase
// - purchasing goods remotely currently requires multiple parties that need to trust each other 
// - simplest configuration involves seller and buyer 
// - buyer would like to receive item from seller and seller would like to get some compensation (ether)

// - problematic part is the shipment 
// - there is no way to determine for sure that item arrived at buyer
// - there are multiple ways to solve this problem, but all fall short in one or other way

// In following example, both parties have to put twice value of item into contract as escrow
// As soon as this happened, Ether will stay locked inside contract until buyer confirms that they received item
// After that, buyer is returned value (half of their deposit) and seller gets three times value 
// (their deposit plus value)
// idea behind this is that both parties have incentive to resolve situation or otherwise their Ether is locked forever

// this contract of course does not solve problem, but gives overview of how you can use state machine-like 
// constructs inside contract

//======================================================================================================

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Purchase {
    uint public value;
    address payable public seller;
    address payable public buyer;

    enum State { Created, Locked, Release, Inactive }
    // The state variable has a default value of the first member, `State.created`
    State public state;

    modifier condition(bool condition_) {
        require(condition_);
        _;
    }

    /// Only the buyer can call this function.
    error OnlyBuyer();
    /// Only the seller can call this function.
    error OnlySeller();
    /// The function cannot be called at the current state.
    error InvalidState();
    /// The provided value has to be even.
    error ValueNotEven();

    modifier onlyBuyer() {
        if (msg.sender != buyer)
            revert OnlyBuyer();
        _;
    }

    modifier onlySeller() {
        if (msg.sender != seller)
            revert OnlySeller();
        _;
    }

    modifier inState(State state_) {
        if (state != state_)
            revert InvalidState();
        _;
    }

    event Aborted();
    event PurchaseConfirmed();
    event ItemReceived();
    event SellerRefunded();

    // Ensure that `msg.value` is an even number.
    // Division will truncate if it is an odd number.
    // Check via multiplication that it wasn't an odd number.
    constructor() payable {
        seller = payable(msg.sender);
        value = msg.value / 2;
        if ((2 * value) != msg.value)
            revert ValueNotEven();
    }

    /// Abort the purchase and reclaim the ether.
    /// Can only be called by the seller before
    /// the contract is locked.
    function abort()
        external
        onlySeller
        inState(State.Created)
    {
        emit Aborted();
        state = State.Inactive;
        // We use transfer here directly. It is
        // reentrancy-safe, because it is the
        // last call in this function and we
        // already changed the state.
        seller.transfer(address(this).balance);
    }

    /// Confirm the purchase as buyer.
    /// Transaction has to include `2 * value` ether.
    /// The ether will be locked until confirmReceived
    /// is called.
    function confirmPurchase()
        external
        inState(State.Created)
        condition(msg.value == (2 * value))
        payable
    {
        emit PurchaseConfirmed();
        buyer = payable(msg.sender);
        state = State.Locked;
    }

    /// Confirm that you (the buyer) received the item.
    /// This will release the locked ether.
    function confirmReceived()
        external
        onlyBuyer
        inState(State.Locked)
    {
        emit ItemReceived();
        // It is important to change the state first because
        // otherwise, the contracts called using `send` below
        // can call in again here.
        state = State.Release;

        buyer.transfer(value);
    }

    /// This function refunds the seller, i.e.
    /// pays back the locked funds of the seller.
    function refundSeller()
        external
        onlySeller
        inState(State.Release)
    {
        emit SellerRefunded();
        // It is important to change the state first because
        // otherwise, the contracts called using `send` below
        // can call in again here.
        state = State.Inactive;

        seller.transfer(3 * value);
    }
}

// ------------------------------------------------------------------------------------------------------------------------------
//==================================
contract Purchase {
    uint public value;
    address payable public seller;
    address payable public buyer;
//==================================
/* 
uint public value; 
- public state variable value of type uint to store purchase value
address payable public seller; 
- public state variable seller of type address payable to store sellers Ethereum address
address payable public buyer; 
- public state variable buyer of type address payable to store the buyers Ethereum address.
enum 
*/ 
//===============================================
enum State { Created, Locked, Release, Inactive }
    // The state variable has a default value of the first member, `State.created`
    State public state;

    modifier condition(bool condition_) {
        require(condition_);
        _;
    }
//===============================================
/*
State { Created, Locked, Release, Inactive } 
- defines an enumeration type called "State" to represent the different stages of the purchase.
State public state; 
- declares a public state variable state of type State to keep track of the current state.

Modifiers and Error Handling:
onlyBuyer and onlySeller modifiers: 
- ensure that specific functions can only be called by buyer or seller
inState modifier: 
- checks that function can only be called in specific state

Events:
Aborted, PurchaseConfirmed, ItemReceived, and SellerRefunded events

Constructor:
- constructor is executed when contract is deployed
performs tasks:
- assigns contract creator's (seller's) address to seller variable
- Splits initial value sent with contract creation (msg.value) in half and assigns it to value variable
Checks if the provided value is even. If not, the contract reverts, ensuring that the value is divisible by 2.

abort Function:
- abort function allows seller to cancel purchase and reclaim funds
- it can only be called in "Created" state

confirmPurchase Function:
- confirmPurchase function allows buyer to confirm purchase by sending twice value
- locks funds until buyer confirms receipt

confirmReceived Function:
- confirmReceived function allows buyer to confirm that they have received item
- releases locked funds to seller

refundSeller Function:
- refundSeller function allows seller to request refund
- refunds seller by sending 3 times value, effectively returning both item value and buyer deposit
*/