// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./utils/access/AccessControlUpgradable.sol";
import "./utils/proxy/UUSPProxyUpgradable.sol";
import "./utils/security/PausableUpgradable.sol";
import "./utils/security/ReentrancyGuardUpgradable.sol";

/**
 * @dev A general purpose  contract that combines between:
 *          -  UUSP Proxy Pattern
 *          -  Access Control
 *          -  Pausable
 *          -  Reentrancy Guard
 * It has an internal init() func without enabling the constructor
 * which means that this contract is only a modular module will be
 * inherited by both:
 *    1. ERC721Upgradable
 *    2. ERC1155Upgradable
 */
contract ERCTokenStandard is
    Initializable,
    AccessControlUpgradable,
    UUSPProxyUpgradable,
    PausableUpgradable,
    ReentrancyGuardUpgradable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ERCTokenStandard_init() internal onlyInitializing {
        __AccessControl_init();
        __PausableUpgradable_init();
        __UUSPProxyUpgradable_init();
        __ReentrancyGuardUpgradable_init();
    }
}
