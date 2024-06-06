// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {IMarketToken} from "./Interfaces.sol";
import {ERC20} from "solady/tokens/ERC20.sol";
import {Ownable} from "solady/auth/Ownable.sol";

contract MarketToken is IMarketToken, ERC20, Ownable {
    string private _name;
    string private _symbol;

    function initialize(string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
        _initializeOwner(msg.sender);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }

    function name() public view override returns (string memory) {
        return _name;
    }

    function symbol() public view override returns (string memory) {
        return _symbol;
    }

    function balanceOf(address account) public view override(ERC20, IMarketToken) returns (uint256) {
        return super.balanceOf(account);
    }

    function totalSupply() public view override(ERC20, IMarketToken) returns (uint256) {
        return super.totalSupply();
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function _guardInitializeOwner() internal pure virtual override returns (bool guard) {
        return true;
    }
}
