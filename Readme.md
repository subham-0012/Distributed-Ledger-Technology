## Expt 1:
```
http://anders.com/blockchain/
https://github.com/anders94/blockchain-demo
```
## Expt 2:
```
perform transaction using metamask
```
## Expt 3:
```
//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;
contract CrowdFunding{
  mapping(address=>uint) public contributors;
  address public manager;
  uint public minimumContribution;
  uint public deadline;
  uint public target;
  uint public raisedAmount;
  uint public noOfContributors;
  struct Request{
    string description;
    address payable recipient;
    uint value;
    bool completed;
    uint noOfVoters;
    mapping(address=>bool)voters;
  }
  mapping(uint=>Request) public requests;
  uint public numRequests;
  constructor(uint _target,uint _deadline){
    target=_target;
    deadline=block.timestamp+_deadline;
    minimumContribution=100 wei;
    manager=msg.sender;
  }
  function sendEth() public payable{
  require(block.timestamp<deadline,"deadline has passed");
  require(msg.value>=minimumContribution,"Minimum Contribution is not met");
  if(contributors[msg.sender]==0){
    noOfContributors++;
  }
  contributors[msg.sender]+=msg.value;
  raisedAmount+=msg.value;
  }
  function getContractBalance() public view returns(uint){
    return address(this).balance;
  }
  function refund() public{
    require(block.timestamp>deadline && raisedAmount<target,"You are not eligible for refund");
    require(contributors[msg.sender]>0);
    address payable user=payable(msg.sender);
    user.transfer(contributors[msg.sender]);
    contributors[msg.sender]=0;
  }
  modifier onlyManager(){
    require(msg.sender==manager,"Only Manager can call this function");
    _;
  }
  function createRequests(string memory _description, address payable _recipient,uint _value) public onlyManager{
    Request storage newRequest= requests[numRequests];
    numRequests++;
    newRequest.description=_description;
    newRequest.recipient=_recipient;
    newRequest.value=_value;
    newRequest.completed=false;
    newRequest.noOfVoters=0;
  }
  function voteRequest(uint _requestNo) public{
    require(contributors[msg.sender]>0,"You must be a contributor");
    Request storage thisRequest=requests[_requestNo];
    require(thisRequest.voters[msg.sender]==false,"You have already voted");
    thisRequest.voters[msg.sender]=true;
    thisRequest.noOfVoters++;
  }
  function makePayment(uint _requestNo) public onlyManager{
    require(raisedAmount>=target);
    Request storage thisRequest=requests[_requestNo];
    require(thisRequest.completed==false,"The request has been completed");
    require(thisRequest.noOfVoters>noOfContributors/2,"Majority does not support");
    thisRequest.recipient.transfer(thisRequest.value);
    thisRequest.completed==true;
  }
}
```
## Expt 4:
```
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
// creating a view function which returns sum of two numbers that are passed as parameter and the state variable number1
function getSumView(uint number2, uint number3) public view returns(uint)
{
uint sum = number1 + number2 + number3;
return sum;}
// creating a pure function which returns sum of two numbers that are passed as parameter
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
```
## Expt 5:
```
faucet.chainlink, goerli faucet
```
## Expt 6:
```
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
```


```
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
```



```
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
```


```
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
```
## Expt 7
```
Implementaion:
1. Install the required binaries, images and dockers of Hyperledger. Visit the official documentaƟon

for choosing your required version. hƩps://hyperledger-fabric.readthedocs.io/en/release-
2.3/install.html#installing- the-latest-release

2. Open your favorite IDE most preferably VScode. Try to clone the official GitHub repository of
Hyperledger Fabric. Type the below command in the terminal. command – git clone
hƩps://github.com/hyperledger/fabric-samples
3. change the directory to test-network so as to get the access of switching the network on and off.
Command – cd test-network
4. Create a repository called chaincode, which is used for the deployment of chaincode contract
which are primiƟve for Hyperledger. Command – mkdir chaincode
5. Open the new network in the chaincode directory for a new connecƟon using the below
command. Command - /.network.sh up
This command creates a Fabric network that consists of two peer nodes, one ordering
node. No channel is created when you run ./network.sh up
6. To stop the network aŌer the connecƟon, use the following command: Command - /.network.sh
down. This command tops the Fabric.


Output:
PS C:\Users\HP\Desktop\Distributed Ledger\fabric-samples> cd .\test-network\
PS C:\Users\HP\Desktop\Distributed Ledger\fabric-samples\test-network> ./network.sh
up
PS C:\Users\HP\Desktop\Distributed Ledger\fabric-samples\test-network>
[main 2023-03-16T04:00:57.747Z] update#setState idle

[main 2023-03-16T04:01:00.392Z] [UtilityProcess id: 1, type: extensionHost, pid:
<none>]: creating new...
[main 2023-03-16T04:01:00.458Z] [UtilityProcess id: 1, type: extensionHost, pid:
10616]: successfully created
```
## Expt 8
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract MerkleProof {
function verify(
bytes32[] memory proof,
bytes32 root,
bytes32 leaf,
uint index
) public pure returns (bool) {
bytes32 hash = leaf;
for (uint i = 0; i < proof.length; i++) {
bytes32 proofElement = proof[i];
if (index % 2 == 0) {
hash = keccak256(abi.encodePacked(hash, proofElement));
} else {
hash = keccak256(abi.encodePacked(proofElement, hash));
}

index = index / 2;
}
return hash == root;
}
}
contract TestMerkleProof is MerkleProof {
bytes32[] public hashes;
constructor() {
string[4] memory transactions = [
"alice -> bob",
"bob -> dave",
"carol -> alice",
"dave -> bob"
];
for (uint i = 0; i < transactions.length; i++) {
hashes.push(keccak256(abi.encodePacked(transactions[i])));
}
uint n = transactions.length;
uint offset = 0;
while (n > 0) {
for (uint i = 0; i < n - 1; i += 2) {
hashes.push(
keccak256(
abi.encodePacked(hashes[offset + i], hashes[offset + i
+ 1])
)
);
}
offset += n;
n = n / 2;
}
}
function getRoot() public view returns (bytes32) {
return hashes[hashes.length - 1];
}
/* verify
3rd leaf
0xdca3326ad7e8121bf9cf9c12333e6b2271abe823ec9edfe42f813b1e768fa57b
root

0xcc086fcc038189b4641db2cc4f1de3bb132aefbd65d510d817591550937818c7
index
2
proof
[0x8da9e1c820f9dbd1589fd6585872bc1063588625729e7ab0797cfc63a00bd950,0x9957
88ffc103b987ad50f5e5707fd094419eb12d9552cc423bd0cd86a3861433]
*/
}
```
## Expt 9
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
 contract DataLocations {
 uint[] public arr;
 mapping(uint => address) map;
 struct MyStruct {
 uint foo;
 }
 mapping(uint => MyStruct) myStructs;
 function f() public {
 _f(arr, map, myStructs[1]);
 // MyStruct storage myStruct = myStructs[1];
 // MyStruct memory myMemStruct = MyStruct(0);
 }
 function _f(
 uint[] storage _arr,
 mapping(uint => address) storage _map,
 MyStruct storage _myStruct
 ) internal {
 }
 function g(uint[] memory _arr) public pure returns (uint[] memory)
{
 return _arr;
 }
 function h(uint[] calldata _arr) external {
 //calldata function
 }
 }
```
## Expt 10
```
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SupplyManagement {
// Variables to store supply data
uint public supplyCount;
address public supplier;
mapping(uint => bool) public supplyReceived;
SupplyItem[] public supplyItems;
// Enum to represent the status of a supply item
enum SupplyStatus {
Ordered,
Delivered,
Cancelled
}
// Struct to represent a supply item
struct SupplyItem {
string name;
uint quantity;
uint price;
SupplyStatus status;
}
// Modifier to restrict access to only the owner of the contract
modifier onlyOwner() {
require(msg.sender == supplier, "Only the supplier can access this function.");
_;
}
// Constructor to set the supplier address and initial supply count
constructor(address _supplier, uint _supplyCount) {
supplier = _supplier;
supplyCount = _supplyCount;
}
// Function to add a supply item
function addSupplyItem(string memory _name, uint _quantity, uint _price)
public onlyOwner {
supplyItems.push(SupplyItem({
name: _name,
quantity: _quantity,
price: _price,
status: SupplyStatus.Ordered
}));
}
// Function to receive supply
function receiveSupply(uint _supplyIndex) public {
require(msg.sender == supplier, "Only the supplier can mark supply as received.");
require(_supplyIndex < supplyCount, "Invalid supply index.");
supplyItems[_supplyIndex].status = SupplyStatus.Delivered;
supplyReceived[_supplyIndex] = true;
}
// Function to cancel a supply item
function cancelSupplyItem(uint _supplyIndex) public onlyOwner {
require(_supplyIndex < supplyCount, "Invalid supply index.");
require(supplyItems[_supplyIndex].status == SupplyStatus.Ordered,
"Cannot cancel a supply item that has already been delivered or cancelled.");
supplyItems[_supplyIndex].status = SupplyStatus.Cancelled;
}
// Function to check if all supplies have been received
function isSupplyComplete() public view returns (bool) {
for (uint i = 0; i < supplyCount; i++) {
if (supplyItems[i].status != SupplyStatus.Delivered){
return false;
}
}
return true;
}
}
```
