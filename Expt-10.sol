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
