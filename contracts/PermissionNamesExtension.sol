pragma solidity ^0.4.0;

contract PermissionNamesExtension {

  address owner = msg.sender;
  address permissionNamesContractAddress;

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function setPermissionNamesContractAddress(address _permissionNamesContractAddress) onlyOwner{
    permissionNamesContractAddress = _permissionNamesContractAddress;
  }
  function getLevel(bytes32 name) returns(uint){
    return(PermissionsNames(permissionNamesContractAddress).levelsNames(name));
  }
}