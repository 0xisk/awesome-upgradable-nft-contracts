// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "../../access/AccessControlUpgradable.sol";
import "../../security/PausableUpgradable.sol";
import "./extensions/ERC1155SupplyUpgradable.sol";
import "./extensions/ERC1155BurnableUpgradable.sol";
import "./extensions/ERC1155MintableUpgradable.sol";
import "./extensions/ERC1155URIStorageUpgradable.sol";

contract ERC1155Upgradable is
    Initializable,
    PausableUpgradable,
    AccessControlUpgradable,
    ERC1155SupplyUpgradable,
    ERC1155MintableUpgradable,
    ERC1155BurnableUpgradable,
    ERC1155URIStorageUpgradeable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERC1155Upgradable_init(string memory baseUri_)
        internal
        onlyInitializing
    {
        __ERC1155_init(baseUri_);
        __ERC1155SupplyUpgradable_init();
        __ERC1155MintableUpgradable_init();
        __ERC1155BurnableUpgradable_init();
        __ERC1155URIStorageUpgradeable_init();
    }

    // The following functions are overrides required by Solidity.
    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155Supply) whenNotPaused {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(
            ERC1155Supply,
            ERC1155URIStorageUpgradeable,
            ERC1155Burnable,
            AccessControlUpgradeable
        )
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
