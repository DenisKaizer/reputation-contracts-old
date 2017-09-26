pragma solidity ^0.4.0;

import "./Permissions.sol";


contract Reputation  {

  struct ReputationChangeHistory {
    address deal;
    int value;
  }

  struct Profile {
    // categoryName => reputationValue
    mapping (string => uint) reputationByCategories;
    // [ dealAddress => reputationChangeValue ]
    ReputationChangeHistory[] reputationChangeHistory;
  }

  mapping (address => Profile) profiles;
  bytes32 levelToChangeRep;
  address permissionsContractAddress = 0x0;

  function change(address dealAddress, address userAddress, int value, string category)  {

    require(Permissions(permissionsContractAddress).checkPermissions(msg.sender,"changeReputation"));
    reputationChange[dealAddress] = value;
    profiles[userAddress].reputationByCategories[category] += value;
  }
}
