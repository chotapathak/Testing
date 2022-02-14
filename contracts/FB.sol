// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.6;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EToken is ERC20 {
    address public owner;

    constructor() ERC20('Fresh Berries', 'FB') {
        _mint(msg.sender, 1000 * 10 ** 18);
        owner = msg.sender;
    }
    // function mint(address _owner, uint256 _amount) external {
    //     require(msg.sender == owner, "Only owner can mint");
    //     _mint(_owner, _amount);
    //     owner.transferFrom(_owner, _amount);
    // }
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }    
    function burn(address _owner, uint256 _amount) external {
        require(msg.sender == owner, "Only owner can burn");
        _burn(_owner, _amount);
    }
}