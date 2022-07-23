// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract CabinetVoting{
    
    struct Candidate{
        uint id;
        string name;
        uint trust;
        uint untrust;
    }
    
    mapping (uint => Candidate) public candidates;
    uint public candidatecount;
    mapping (address => bool) public voter;
    
    constructor() {
        addCandidate("Prawit");
        addCandidate("Prayut");
        addCandidate("Anutin");
        addCandidate("Chaiwut");
    }
    
    function addCandidate(string memory _name) private{
        candidatecount++;
        candidates[candidatecount] = Candidate(candidatecount, _name, 0,0);
    }
    
    function voteTrust(uint _candidateid) public{
        require(!voter[msg.sender]);
        voter[msg.sender] = true;
        candidates[_candidateid].trust ++;
    }

    function voidUntrust(uint _candidateid) public{
        require(!voter[msg.sender]);
        voter[msg.sender] = true;
        candidates[_candidateid].untrust ++;
    }

    function getResult(uint _candidateid) public view returns(string  memory _result) {
        if (candidates[_candidateid].trust > candidates[_candidateid].untrust) {
            _result = "TRUST";
        }
        else{
            _result = "UNTRUST";
        }
    }
}
