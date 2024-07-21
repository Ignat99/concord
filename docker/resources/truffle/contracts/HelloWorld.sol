pragma solidity ^0.5.8;
contract HelloWorld {
    address public creator;
    string public message;

    constructor() public {
        creator = msg.sender;
        message = 'Hello, world';
    }
}
