// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "../../access/AccessControlUpgradable.sol";
import "./extensions/ERC721MintableUpgradable.sol";
import "./extensions/ERC721BurnableUpgradable.sol";
import "./extensions/ERC721URIStorageUpgradable.sol";

contract ERC721Upgradable is
    Initializable,
    AccessControlUpgradable,
    ERC721URIStorageUpgradable,
    ERC721MintableUpgradable,
    ERC721BurnableUpgradable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERC721Upgradable_init(
        string memory name_,
        string memory symbol_,
        address burner_,
        address minter_
    ) internal onlyInitializing {
        __ERC721_init(name_, symbol_);
        __ERC721URIStorageUpgradable_init();
        __ERC721MintableUpgradable_init(minter_);
        __ERC721BurnableUpgradable_init(burner_);
    }

    function burn(uint256 tokenId_) public override onlyRole(BURNER_ROLE) {
        _burn(tokenId_);
    }

    function batchBurn(uint256[] memory tokenIds_)
        public
        override
        onlyRole(BURNER_ROLE)
    {
        for (uint256 i = 0; i < tokenIds_.length; i++) {
            _burn(tokenIds_[i]);
        }
    }

    // The following functions are overrides required by Solidity.
    function _burn(uint256 tokenId_)
        internal
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
    {
        super._burn(tokenId_);
    }

    function tokenURI(uint256 tokenId_)
        public
        view
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
        returns (string memory)
    {
        return super.tokenURI(tokenId_);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(
            AccessControlUpgradeable,
            ERC721Mintable,
            ERC721URIStorage,
            ERC721Burnable
        )
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
