# SimpleSmartContract

Simple Smart Contract 是一个适合新手，开发智能合约的项目。

项目使用Solidity语言开发。

## 项目部署

### 本地开发网络

```shell
npx hardhat node
```

执行命令后，会在本地启动以太坊开发网络，可以在钱包（例如MetaMask）中连接此网络。

### 编译智能合约

```shell
npx hardhat compile
```

执行命令后，在 `./artifacts`目录下生成编译后的智能合约。
