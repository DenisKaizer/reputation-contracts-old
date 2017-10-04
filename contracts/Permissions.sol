pragma solidity ^0.4.0;

import "./PermissionNamesExtension.sol";


contract Permissions is PermissionNamesExtension {

  mapping (address => uint) public permissions;
  uint permSetLevel;
  //uint allowedLevelToSet;
  address owner = msg.sender;

  function checkPermission(address allowedAddress,bytes32 levelName) returns (bool) {
    uint level = getLevelbyName(levelName);
    if (permissions[allowedAddress] == level) {
      return true;
    }

    return false;
  }

  function setPermission(address allowedAddress,bytes32 levelName) {
    uint level = getLevelbyName(levelName);
    //require(level <= allowedLevelToSet);
    require(checkPermission(msg.sender, "setPerm"));
    permissions[allowedAddress] = level;
  }

  function setAdminPerms(address allowedAddress)  {
    require(msg.sender == owner);
    permissions[allowedAddress] = getLevelbyName("setPerm");
  }
}