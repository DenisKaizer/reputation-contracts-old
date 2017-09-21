pragma solidity ^0.4.0;

import "./PermissionNamesExtension.sol";
import "./Permissions.sol";

contract Reputation {
  struct Profile {
    // categoryName => reputationValue
    mapping (string => uint) reputationByCategories;
    // [ dealAddress => reputationChangeValue ]
    mapping (address => int)[] reputationChangeHistory;
  }

  mapping (address => Profile) profiles;
  bytes32 levelToChangeRep;
  address permissionsContractAddress = 0x0;

  function change(address userAddress, int value, string category, address dealAddress){
    require(Permissions(permissionsContractAddress).checkPermissions(msg.sender, PermissionNamesExtension.getLevel()));
    reputationChange[dealAddress] = value;
    profiles[userAddress].reputationByCategories[category] += value;
  }
}
