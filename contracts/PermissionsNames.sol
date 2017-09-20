pragma solidity ^0.4.0;

contract PermissionsNames {

  mapping (bytes32 => uint) public levelsNames;
  address owner = msg.sender;

  function PermissionsNames(){
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function setPermission(bytes32 name, uint level) onlyOwner{
    levelsNames[name] = level;
  }

}
