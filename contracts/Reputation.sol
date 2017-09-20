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

  function change(address userAddress, value, category){
    profiles[userAddress]
  }
}
