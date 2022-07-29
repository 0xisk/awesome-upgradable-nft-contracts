// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";

import "../../../access/AccessControlUpgradable.sol";

/**
 * @dev An ERC721Burnable contract but without taking care of deleting the TokenURI
 */
contract ERC721BurnableUpgradable is
    Initializable,
    ERC721BurnableUpgradeable,
    AccessControl
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERC721BurnableUpgradable_init(address burner_)
        internal
        onlyInitializing
    {
        __ERC721Burnable_init();

        _grantRole(BURNER_ROLE, burner_);
    }

    function burn(uint256 tokenId_)
        public
        virtual
        override(ERC721BurnableUpgradeable)
        onlyRole(BURNER_ROLE)
    {
        super.burn(tokenId_);
    }

    function batchBurn(uint256[] memory tokenIds_)
        public
        virtual
        onlyRole(BURNER_ROLE)
    {
        for (uint256 i = 0; i < tokenIds_.length; i++) {
            super.burn(tokenIds_[i]);
        }
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
