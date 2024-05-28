// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract lottery {
address public manager;
address payable[] public players;
address payable public winner;

constructor(){
    manager=msg.sender;

}
function participate() public payable {
require( msg.value ==1 ether,"plz pay 1 Ether only");
players.push(payable(msg.sender));
}

function getbalance() public view returns (uint){
require(manager == msg.sender,"you not access");
return address(this).balance;
}

function RandomNumber() internal view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players)));
    }

 function pickwinner()public{
    require(manager==msg.sender,"you are not manager");
    require(players.length>=3,"players are less than three");
    uint r=RandomNumber();
    uint index=r%players.length;
    winner=players[index];
    winner.transfer(getbalance());
players =new address payable[](0);

 }

} 