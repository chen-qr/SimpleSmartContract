// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract MyNFT {

    // Token用来保存NFT的信息
    struct Token {
        string name;        // Token名称
        string description; // Token描述
        address owner;       // Token拥有者
    }

    // 为每个token创建一个Token ID，通过Token ID来检索Token
    mapping(uint256 => Token) private tokens;

    // Token ID缓存值，每次创建Token时，用该值作为新增Token的ID
    // 1 作为第一个ID，每次创建token后，值会增加
    uint256 nextTokenId = 1;

    // 定义创建（发行）NFT的函数
    // 使用memory来定义变量，相当于把变量的值，复制一份，供函数使用。函数运行结束后该数据会清空。
    // 这么做的目的，是避免传入指针时，在函数中操作指针，影响到远来的数据
    function mint(string memory name, string memory description) 
        public 
        returns (uint256) {
        // 创建一个Token
        Token memory newNFT = Token(name, description, msg.sender);
        // 保存新的NFT
        tokens[nextTokenId] = newNFT;
        // 缓存ID值自增
        nextTokenId += 1;
        // 返回新NFT的ID
        return nextTokenId - 1;
    }

    // 创建查询NFT信息的函数
    function getNFT(uint256 _tokenId) public
        view // 只读函数，不修改state variables
        returns (
            string memory name, string memory description, address owner
        ) 
    {
        // 检验参数_tokenId
        require(_tokenId >= 1 && _tokenId < nextTokenId, "Invalid token ID");
        // 根据tokenid检索NFT信息
        // 使用memory store temporary data，减少gas fee
        Token memory token = tokens[_tokenId];
        
        // 返回数据
        // name ，description，owner 这三个变量，已经在函数的returns中定义了，就无须再定义
        // 直接给这三个变量赋值后，会自动return这三个变量
        name = token.name;
        description = token.description;
        owner = token.owner;
    }
}