
pragma solidity ^0.4.19;

contract NFTToken {
    event Mint(address indexed _to, uint256 indexed _tokenId, string _ipfsHash);
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    uint256 tokenCounter = 1;
   
    mapping(uint256 => address) internal idToOwner;
    mapping(uint256 => string) internal ipfs;

    function mint(address _to, string _ipfsHash) public {
        uint256 _tokenId = tokenCounter;
        idToOwner[_tokenId] = _to;
        ipfs[_tokenId] = _ipfsHash;
        tokenCounter++;
        emit Mint(_to, _tokenId, _ipfsHash);
    }
    function transfer(address _to, uint256 _tokenId) public {
        require(msg.sender == idToOwner[_tokenId]);
        idToOwner[_tokenId] = _to;
        emit Transfer(msg.sender, _to, _tokenId);
    }
     function ownerOf(uint256 _tokenId) external  view returns (address)
     {
        return idToOwner[_tokenId];
     }
     function getNFT(uint256 _tokenId) external  view returns (string)
     {
        return ipfs[_tokenId];
     }
}