// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import "hardhat/console.sol";

contract StorageArr {
    constructor() {}

    uint256[] nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    modifier inBounds(uint256 i) {
        //error code rather than string/ gas optimization tech
        require(i < nums.length - 1, "Error OOB");
        _;
    }

    function removeIndex(uint256 index) public inBounds(index) returns (uint256) {
        //copy into memory
        uint256[] memory _nums = nums;
        //swamp indices down until end of arr
        //pop off last element
        for (uint256 i = index; i < _nums.length - 1; i++) {
            _nums[i] = _nums[i + 1];
        }
        _nums = nums;
        nums.pop();
        return _nums.length;
    }
}
