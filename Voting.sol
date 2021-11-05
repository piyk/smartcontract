pragma solidity >=0.7.0;

contract Voting{
    
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    
    mapping (uint => Candidate) public candidates;
    uint public candidatecount;
    mapping (address => bool) public citizen;
    
    constructor() public{
        addCandidate("Lisa");
        addCandidate("Jennie");
        addCandidate("Jisoo");
        addCandidate("Rose");
    }
    
    function addCandidate(string memory _name) private{
        candidatecount++;
        candidates[candidatecount] = Candidate(candidatecount, _name, 0);
    }
    
    function vote(uint _candidateid) public{
        require(!citizen[msg.sender]);
        
        citizen[msg.sender] = true;
        candidates[_candidateid].voteCount ++;
    }
}