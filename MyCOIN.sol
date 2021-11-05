pragma solidity ^0.4.19;

contract MyCOIN {
    
    string public constant name = "MyCOIN";
    string public constant symbol = "MCN";
    uint8 public constant decimals = 18;  
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    
    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;
    
    uint256 totalSupply_;

    using math for uint;
   
    constructor(uint256 total) public {  
	    totalSupply_ = total;
	    balances[msg.sender] = totalSupply_;
    }  

    function totalSupply() public view returns (uint256) {
	    return totalSupply_;
    }
    
    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }
   
     function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
    
}

library math { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}