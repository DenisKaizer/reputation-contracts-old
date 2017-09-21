pragma solidity ^0.4.0;

import "./PermissionNamesExtension.sol";


contract Permissions is PermissionNamesExtension {

  mapping (address => uint) public permissions;
  uint permSetLevel;
  uint allowedLevelToSet;

  function checkPermission(address allowedAddress,uint level) returns (bool) {
    if (permissions[allowedAddress] == level) {
      return true;
    }

    return false;
  }

  function setPermission(address allowedAddress,uint level) {
    require(level <= allowedLevelToSet);
    require(checkPermissions(msg.sender, PermissionNamesExtension.getLevel("setPerm")));
    permissions[allowedAddress] = level;
  }
}
