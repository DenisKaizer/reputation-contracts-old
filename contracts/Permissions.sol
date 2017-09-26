pragma solidity ^0.4.0;

import "./PermissionNamesExtension.sol";


contract Permissions is PermissionNamesExtension {

  mapping (address => uint) public permissions;
  uint permSetLevel;
  uint allowedLevelToSet;

  function checkPermission(address allowedAddress,bytes32 levelName) returns (bool) {
    uint level = PermissionNamesExtension.getLevelByName(levelName);
    if (permissions[allowedAddress] == level) {
      return true;
    }

    return false;
  }

  function setPermission(address allowedAddress,bytes32 levelName) {
    uint level = PermissionNamesExtension.getLevelByName(levelName);
    require(level <= allowedLevelToSet);
    require(checkPermissions(msg.sender, PermissionNamesExtension.getLevel("setPerm")));
    permissions[allowedAddress] = level;
  }
}
