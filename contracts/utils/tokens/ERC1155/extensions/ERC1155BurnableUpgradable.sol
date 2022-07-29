// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155BurnableUpgradeable.sol";

contract ERC1155BurnableUpgradable is
    Initializable,
    ERC1155BurnableUpgradeable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERC1155BurnableUpgradable_init() internal onlyInitializing {
        __ERC1155Burnable_init();
    }

    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155Upgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
