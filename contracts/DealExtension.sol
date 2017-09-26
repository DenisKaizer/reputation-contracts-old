pragma solidity ^0.4.0;

import "./Reputation.sol";


contract DealExtension {

  address reputationContractAddress = "0x0";
  address owner = msg.sender;
  string key;

  modifier onlyForseti {
    require(msg.sender == owner);
    _;
  }

  function changeReputation(address userAddress, int value, string category) internal {
    Reputation(reputationContractAddress).change(userAddress, value, category, this);
  }

  function setReputationContractAddress(address newAddress) onlyOwner {
    reputationContractAddress = newAddress;
  }

}