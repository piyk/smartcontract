// SPDX-License-Identifier: GPL-3.0
pragma solidity  >=0.7.0;
contract AssetTracking {
    
    struct Asset {
        string  name;
        string  description;
        string  manufacturer;
        bool initialized;    
    }
    mapping(string  => Asset) private assetStore;
    mapping(address => mapping(string => bool)) private walletStore;
   
    event AssetCreate(address account, string id, string manufacturer);
    event AssetTransfer(address from, address to, string id);
    
    function createAsset(string memory name, string memory description, string memory id, string memory manufacturer)public{
        require(!assetStore[id].initialized);
        assetStore[id] = Asset(name, description, manufacturer,true);
        walletStore[msg.sender][id] = true;
        emit AssetCreate(msg.sender, id, manufacturer);
    }
    function transferAsset(address to, string memory id) public {
 
        require(assetStore[id].initialized);
        require(walletStore[msg.sender][id]);
     
        walletStore[msg.sender][id] = false;
        walletStore[to][id] = true;
        emit AssetTransfer(msg.sender, to, id);
    }
    function getAssetByID(string  memory id) public view returns (string memory, string memory, string memory) {
 
        return (assetStore[id].name, assetStore[id].description, assetStore[id].manufacturer);
    }
    function isOwnerOf(address owner, string memory id) public view returns (bool) {
 
        if(walletStore[owner][id]) {
            return true;
        }
     
        return false;
}
    
}
