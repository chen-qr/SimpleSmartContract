// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract MyNFT {

    // Token用来保存NFT的信息
    struct Token {
        string name;        // Token名称
        string description; // Token描述
        string owner;       // Token拥有者
    }
}