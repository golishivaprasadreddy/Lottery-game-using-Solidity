Lottery Game Smart Contract Using Solidity

A lottery game in Solidity operates on the Ethereum blockchain and allows players to participate by contributing a fixed amount of Ether. Once the required number of players enter, a winner is randomly selected, and the total pool is transferred to them.


---

Smart Contract Features

1. Minimum Players: At least three players must participate.


2. Entry Fee: Each player contributes 1 Ether to enter.


3. Random Winner Selection: A pseudo-random function selects a winner.


4. Only Owner Can Reset: After selecting the winner, the contract resets for the next round.






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





