// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    struct Product {
        uint id;
        string name;
        string origin;
        address owner;
        string status;
        uint timestamp;
        string[] history;
    }

    mapping(uint => Product) public products;
    uint public productCount;
    
    event ProductAdded(uint id, string name, string origin, address owner, uint timestamp);
    event OwnershipTransferred(uint id, address previousOwner, address newOwner);
    event StatusUpdated(uint id, string newStatus);
    event ProductVerified(uint id, address verifier, string remarks);
    event ProductRecalled(uint id, string reason);

    modifier onlyOwner(uint _id) {
        require(products[_id].owner == msg.sender, "Only owner can perform this action");
        _;
    }

    function addProduct(string memory _name, string memory _origin) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _origin, msg.sender, "Created", block.timestamp, new string[](0));
        emit ProductAdded(productCount, _name, _origin, msg.sender, block.timestamp);
    }

    function transferOwnership(uint _id, address _newOwner) public onlyOwner(_id) {
        address previousOwner = products[_id].owner;
        products[_id].owner = _newOwner;
        emit OwnershipTransferred(_id, previousOwner, _newOwner);
    }

    function updateStatus(uint _id, string memory _newStatus) public onlyOwner(_id) {
        products[_id].status = _newStatus;
        products[_id].history.push(_newStatus);
        emit StatusUpdated(_id, _newStatus);
    }

    function verifyProduct(uint _id, string memory _remarks) public {
        require(_id > 0 && _id <= productCount, "Invalid product ID");
        emit ProductVerified(_id, msg.sender, _remarks);
    }

    function recallProduct(uint _id, string memory _reason) public onlyOwner(_id) {
        products[_id].status = "Recalled";
        emit ProductRecalled(_id, _reason);
    }

    function getProductHistory(uint _id) public view returns (string[] memory) {
        return products[_id].history;
    }
}
