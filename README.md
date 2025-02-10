Lottery Game Smart Contract Using Solidity

A lottery game in Solidity operates on the Ethereum blockchain and allows players to participate by contributing a fixed amount of Ether. Once the required number of players enter, a winner is randomly selected, and the total pool is transferred to them.


---

Smart Contract Features

1. Minimum Players: At least three players must participate.


2. Entry Fee: Each player contributes 1 Ether to enter.


3. Random Winner Selection: A pseudo-random function selects a winner.


4. Only Owner Can Reset: After selecting the winner, the contract resets for the next round.




---

Solidity Smart Contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address payable[] public players;

    constructor() {
        manager = msg.sender; // Owner of the contract
    }

    // Function to enter the lottery (requires 1 Ether)
    function enter() public payable {
        require(msg.value == 1 ether, "Entry fee is 1 Ether");
        players.push(payable(msg.sender));
    }

    // Function to get a random number (Not truly random)
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players.length)));
    }

    // Function to pick a winner (Only manager can call)
    function pickWinner() public restricted {
        require(players.length >= 3, "Minimum 3 players required");
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable Reset players list
    }

    // Modifier to restrict access to manager
    modifier restricted() {
        require(msg.sender == manager, "Only manager can call this function");
        _;
    }

    // Function to get all players
    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}


---

Explanation of the Contract

1. Manager (Owner): The person deploying the contract acts as the lottery manager.


2. Players List: A dynamic array stores all players who entered the lottery.


3. Enter Function (enter):

Requires 1 Ether as an entry fee.

Adds the player's address to the players array.



4. Random Winner Selection (pickWinner):

Ensures at least 3 players have joined.

Uses keccak256 hashing function (not perfectly random but sufficient for simple lotteries).

Transfers the total Ether balance to the winner.

Resets the players list.



5. Modifier (restricted): Restricts certain functions to be called only by the manager.


6. Get Players (getPlayers): Allows anyone to check the list of players.




---

How to Deploy & Play

1. Deploy the Contract:

Use Remix IDE or Hardhat with a test Ethereum network.



2. Players Enter the Game:

Players call the enter() function with 1 Ether.



3. Manager Picks a Winner:

After at least 3 players join, the manager calls pickWinner() to select and reward a winner.





---

Security Considerations

Randomness Issue:

keccak256 is not truly random. Consider integrating Chainlink VRF for better randomness.


Reentrancy Attacks:

Ensure Solidity version 0.8.0+ (which includes built-in reentrancy protections).


Gas Optimization:

Reduce storage variables to save gas costs.




---

Would you like any modifications or additional features such as a time-based draw or multiple winners?

