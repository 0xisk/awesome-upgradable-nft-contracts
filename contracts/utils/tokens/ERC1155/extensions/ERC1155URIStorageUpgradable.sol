// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155URIStorageUpgradeable.sol";

import "../../../security/PausableUpgradable.sol";

contract ERC1155URIStorage is Initializable, PausableUpgradable, ERC1155URIStorageUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERC1155URIStorageUpgradeable_init() internal onlyInitializing {
        __ERC1155URIStorage_init();
    }

    function uri(uint256 tokenId_)
        public
        view
        virtual
        override
        returns (string memory)
    {
        super.uri(tokenId_);
    }

    function setURI(string memory newuri_) public onlyRole(URI_SETTER_ROLE) {
        _setURI(newuri_);
    }

    function setBaseURI(string memory baseURI_) public onlyRole(URI_SETTER_ROLE) {
        _setBaseURI(baseURI_);
    }

    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155Upgradeable, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
