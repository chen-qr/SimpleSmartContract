// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract SimpleToken {
  // 保存账户地址对应的代币Token余额
  mapping(address => uint256) private balances;
  // 保存代币Token的总供应量
  uint256 public totalSupply;
  // 保存代币Token的发行人
  address private owner;

  constructor() {
    owner = msg.sender;
  }

  // 增发代币Token
  function mint(address recipient, uint256 amount) public {
    // 权限检验，只有代币的发行人，才能进行增发代币Token
    require(msg.sender == owner, "Only the owner can perform this action");
    balances[recipient] += amount;
    totalSupply += amount;
  }

  // 检查账户的余额
  function balanceOf(address account) public view returns (uint256) {
    return balances[account];
  }

  // 转账
  function transfer(address recipient, uint256 amount) public {
    require(amount <= balances[msg.sender], "Not enough balance.");
    balances[msg.sender] -= amount;
    balances[recipient] += amount;
  }
}