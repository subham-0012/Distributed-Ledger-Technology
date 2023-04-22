//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Example {
// declare a state variable
uint public number1;
uint public score;
// constructor function
constructor(uint _num,uint _score) {
number1 = _num;
score=_score;
}
// getter function
function getScore() public view returns (uint) {
return score;

}
// setter function
function setScore(uint new_score)public {
score = new_score;
}
// creating a view function which returns sum of two numbers that are
passed as parameter and the state variable number1
function getSumView(uint number2, uint number3) public view returns(uint)
{
uint sum = number1 + number2 + number3;
return sum;}
// creating a pure function which returns sum of two numbers that are
passed as parameter
function getSumPure(uint number, uint number2) public pure returns(uint) {
uint sum = number + number2;
return sum;}
// Function to demonstrate the use of events
event ExampleEvent(uint256 value);
// Function that triggers an event
function triggerEvent(uint256 value) public {
emit ExampleEvent(value);
}
}
