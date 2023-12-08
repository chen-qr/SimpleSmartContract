// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleToken is ERC20 {

  constructor() ERC20("SimpleToken", "ST") {}

  // 增发代币Token
  function mint(address recipient, uint256 amount) public {
    _mint(recipient, amount);
  }
}