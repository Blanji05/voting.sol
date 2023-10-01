// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address private owner;
    mapping(address => bool) private registeredVoters;
    mapping(address => bool) private hasVoted;
    uint256 private voteCount;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    modifier onlyRegisteredVoter() {
        require(registeredVoters[msg.sender], "Only registered voters can perform this action");
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }

    function registerVoter(address _voterAddress) public onlyOwner {
        registeredVoters[_voterAddress] = true;
    }

    function vote() public onlyRegisteredVoter {
        // Implement your voting logic here, for example, incrementing voteCount.
        voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getVoteCount() public view returns (uint256) {
        return voteCount;
    }
}
