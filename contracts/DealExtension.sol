pragma solidity ^0.4.0;

import "./Permissions.sol";
import "./Reputation.sol";

contract DealExtension {

  address permissionsContractAddress = 0x0;
  address owner = msg.sender;
  string key;

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function changeReputation(address userAddress, int value, string category) internal {
    require(Permissions(permissionsContractAddress).checkPermissions(msg.sender, level));
    Reputation(reputationContractAddress).change(userAddress, value, category, this);
  }

}