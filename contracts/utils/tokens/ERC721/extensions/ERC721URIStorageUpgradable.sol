// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

import "../../../access/AccessControlUpgradable.sol";

/**
 * @dev An ERC721Storage contract that has a more advanced _burn function,
 * which makes sure to delete the TokenURI after burning the token.
 */
contract ERC721URIStorageUpgradable is
    Initializable,
    ERC721URIStorageUpgradeable,
    AccessControlUpgradable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERC721URIStorageUpgradable_init() internal onlyInitializing {
        __ERC721URIStorage_init();
    }

    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721Upgradeable, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
