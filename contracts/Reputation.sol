pragma solidity ^0.4.0;

import "./PermissionNamesExtension.sol";
import "./Permissions.sol";


contract Reputation is PermissionExtension {

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

  // TODO replace require with "onlyWithPermission"
  function change(address dealAddress, address userAddress, int value, string category) onlyWithPermission {
    // Permissions memory permissions = Permissions(permissionsContractAddress);

    require(Permissions(permissionsContractAddress).checkPermissions(msg.sender, PermissionNamesExtension.getLevel()));
    reputationChange[dealAddress] = value;
    profiles[userAddress].reputationByCategories[category] += value;
  }
}
