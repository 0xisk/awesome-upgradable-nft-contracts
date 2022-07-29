// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./ERCTokenStandard.sol";
import "./utils/tokens/ERC1155/ERC1155Upgradable.sol";

contract ERC1155 is Initializable, ERCTokenStandard, ERC1155Upgradable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(string memory baseUri_) public initializer {
        ___init();
        __ERCTokenStandard_init();
        __ERC1155Upgradable_init(baseUri_);
    }

    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
