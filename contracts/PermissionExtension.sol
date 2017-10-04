pragma solidity ^0.4.0;

import "./Permissions.sol";

contract PermissionExtension {

  address permissionsContractAddress;

  function setPermission(address dealAddress, bytes32 levelName) {
    Permissions(permissionsContractAddress).setPermission(dealAddress, levelName);
  }

  function setPermissionsContractAddress(address _permissionsContractAddress)  {
    permissionsContractAddress = _permissionsContractAddress;
  }
}
