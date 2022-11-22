// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract CharityToken is ERC20Votes {
    uint256 public max_supply = 1000 * 10 ** 18;
    
    constructor() ERC20("Charity", "CHTY") ERC20Permit("Charity") {
        _mint(msg.sender, max_supply);
    }

    /// @dev Move voting power when tokens are transferred.
    function _afterTokenTransfer(
		address from,
		address to,
		uint256 amount
	) internal override(ERC20Votes) {
		super._afterTokenTransfer(from, to, amount);
	}

	function _mint(address to, uint256 amount) internal override(ERC20Votes) {
		super._mint(to, amount);
	}

	function _burn(address account, uint256 amount)
		internal
		override(ERC20Votes)
	{
		super._burn(account, amount);
	}
}