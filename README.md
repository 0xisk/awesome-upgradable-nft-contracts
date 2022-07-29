# Awesome Upgradable NFT Contracts

An NFT template contracts for both ERC721, and ERC1155 using UUSP proxy pattern.


```
contracts
├── ERC1155.sol
├── ERC721.sol
├── ERCTokenStandard.sol
└── utils
    ├── access
    │   └── AccessControlUpgradable.sol
    ├── helpers
    │   └── ContextUpgradable.sol
    ├── proxy
    │   └── UUSPProxyUpgradable.sol
    ├── security
    │   ├── PausableUpgradable.sol
    │   └── ReentrancyGuardUpgradable.sol
    └── tokens
        ├── ERC1155
        │   ├── ERC1155Upgradable.sol
        │   └── extensions
        │       ├── ERC1155BurnableUpgradable.sol
        │       ├── ERC1155MintableUpgradable.sol
        │       ├── ERC1155SupplyUpgradable.sol
        │       └── ERC1155URIStorageUpgradable.sol
        └── ERC721
            ├── ERC721Upgradable.sol
            └── extensions
                ├── ERC721BurnableUpgradable.sol
                ├── ERC721MintableUpgradable.sol
                └── ERC721URIStorageUpgradable.sol
```