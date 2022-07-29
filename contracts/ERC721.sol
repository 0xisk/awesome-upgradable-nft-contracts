// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./ERCTokenStandard.sol";
import "./utils/tokens/ERC721/ERC721Upgradable.sol";

contract Customer is
    Initializable,
    ERCTokenStandard,
    ERC721Upgradable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(
        string memory name_,
        string memory symbol_,
        address burner_,
        address minter_
    ) public initializer {
        __ERCTokenStandard_init();
        __ERC721Upgradable_init(name_, symbol_, burner_, minter_);
    }

    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
