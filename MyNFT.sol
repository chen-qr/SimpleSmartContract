// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract MyNFT {

    // Token用来保存NFT的信息
    struct Token {
        string name;        // Token名称
        string description; // Token描述
        string owner;       // Token拥有者
    }

    // 为每个token创建一个Token ID，通过Token ID来检索Token
    mapping(uint256 => Token) private tokens;

    // Token ID缓存值，每次创建Token时，用该值作为新增Token的ID
    // 1 作为第一个ID，每次创建token后，值会增加
    uint256 nextTokenId = 1;
}