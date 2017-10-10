pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract EthMessage is Ownable {

    /*
    The cost of posting a message will be currentPrice.

    The currentPrice will increase by basePrice every time a message is bought.
    */

    uint public constant BASEPRICE = 0.01 ether;
    uint public currentPrice = 0.01 ether;
    string public message = "";

    function withdraw() public payable onlyOwner {
        msg.sender.transfer(this.balance);
    }
    
    // This is only for messed up things people put.
    function removeMessage() onlyOwner public {
        message = "";
    }

    modifier requiresPayment () {
        require(msg.value >= currentPrice);
        if (msg.value > currentPrice) {
            msg.sender.transfer(msg.value - currentPrice);
        }
        currentPrice += BASEPRICE;
        _;
    }

    function putMessage(string messageToPut) public requiresPayment payable {
        message = messageToPut;
    }

    function () {
        throw;
    }
}