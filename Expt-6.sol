Multilevel Inheritance:


pragma solidity >=0.4.22 <0.6.0;
// Defining parent contract A
contract A {
// Declaring internal
// state variable
string internal x;
// Defining external function
// to set value of
// internalstate variable
function getA() external {
x = "subham gupta";
}
// Declaring internal
// state variable
uint internal sum;
// Defining external function
// to set the value of
// internal state variable sum
function setA() external {

uint a = 10;
uint b = 20;
sum = a + b;
}
}
// Defining child contract B
// inheriting parent contract A
contract B is A {
// Defining external function to
// return state variable x
function getAstr(
) external view returns(string memory){
return x;
}
}
contract C is A {
function getAValue(
) external view returns(uint){
return sum;
}
}
contract caller {
B contractB = new B();
C contractC = new C();
function testInheritance(
) public returns (
string memory, uint) {
return (
contractB.getAstr(), contractC.getAValue());
}
}




Single Level inheritance:
pragma solidity >=0.4.22 <0.6.0;
// Defining contract
contract parent{
// Declaring internal
// state variable
uint internal sum;
// Defining external function
// to set value of internal

// state variable sum
function setValue() external {
uint a = 10;
uint b = 20;
sum = a + b;
}
}
// Defining child contract
contract child is parent{
// Defining external function
// to return value of
// internal state variable sum
function getValue(
) external view returns(uint) {
return sum;
}
}
// Defining calling contract
contract caller {
// Creating child contract object
child cc = new child();
// Defining function to call
// setValue and getValue functions
function testInheritance(
) public returns (uint) {
cc.setValue();
return cc.getValue();
}
}





Multiple Inheritance:
// Solidity program to
// demonstrate
// Multiple Inheritance
pragma solidity >=0.4.22 <0.6.0;
// Defining contract A
contract A {
// Declaring internal
// state variable
string internal x;
// Defining external function
// to set value of
// internal state variable x
function setA() external {
x = "GeeksForGeeks";
}
}
// Defining contract B
contract B {
// Declaring internal
// state variable
uint internal pow;
// Defining external function

// to set value of internal
// state variable pow
function setB() external {
uint a = 2;
uint b = 20;
pow = a ** b;
}
}
// Defining child contract C
// inheriting parent contract
// A and B
contract C is A, B {
// Defining external function
// to return state variable x
function getStr(
) external returns(string memory) {
return x;
}
// Defining external function
// to return state variable pow
function getPow(
) external returns(uint) {
return pow;
}
}
// Defining calling contract
contract caller {
// Creating object of contract C
C contractC = new C();
// Defining public function to
// return values from functions
// getStr and getPow
function testInheritance(
) public returns(string memory, uint) {
contractC.setA();
contractC.setB();
return (
contractC.getStr(), contractC.getPow());
}
}




Hierarchical Inheritance:
// Solidity program to demonstrate
// Hierarchical Inheritance
pragma solidity >=0.4.22 <0.6.0;
// Defining parent contract A
contract A {
// Declaring internal
// state variable
string internal x;
// Defining external function
// to set value of
// internalstate variable
function getA() external {
x = "GeeksForGeeks";
}
// Declaring internal
// state variable
uint internal sum;
// Defining external function
// to set the value of
// internal state variable sum
function setA() external {
uint a = 10;
uint b = 20;

sum = a + b;
}
}
// Defining child contract B
// inheriting parent contract A
contract B is A {
// Defining external function to
// return state variable x
function getAstr(
) external view returns(string memory){
return x;
}
}

// Defining child contract C
// inheriting parent contract A
contract C is A {
// Defining external function to
// return state variable sum
function getAValue(
) external view returns(uint){
return sum;
}
}
// Defining calling contract
contract caller {
// Creating object of contract B
B contractB = new B();
// Creating object of contract C
C contractC = new C();
// Defining public function to
// return values of state variables
// x and sum
function testInheritance(
) public returns (
string memory, uint) {
return (
contractB.getAstr(), contractC.getAValue());
}
}
