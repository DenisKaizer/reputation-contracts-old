pragma solidity ^0.4.0;

import "./Permissions.sol";


contract Reputation  {


  struct Profile {
  // categoryName => reputationValue
  mapping (string => int) reputationByCategories;
  // [ dealAddress => reputationChangeValue ]
  mapping (address => int) reputationChangeHistory;
  }

  mapping (address => Profile) profiles;
  bytes32 levelToChangeRep;
  address permissionsContractAddress = 0x0;

  function change(address userAddress, int value, string category)  {
    address dealAddress = msg.sender;
    require(Permissions(permissionsContractAddress).checkPermission(msg.sender,"changeReputation"));
    profiles[userAddress].reputationChangeHistory[dealAddress] = value;
    profiles[userAddress].reputationByCategories[category] += value;
  }
}
