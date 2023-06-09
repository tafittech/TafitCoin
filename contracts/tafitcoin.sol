// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "deps/.deps/ERC20.sol";
import "deps/.deps/ERC20Burnable.sol";
import "deps/.deps/Pausable.sol";
import "deps/.deps/Ownable.sol";

contract TafitCoins is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("shilling", "TTSC") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
