// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

library sortAndUnique {
    
    function sort (uint[] storage _arr) internal returns (uint[] memory){
        
        uint n = _arr.length;
        bool sorted;

        for (uint i = 0; i < n - 1; i++) {
            sorted = true;
            for (uint j = 0; j < n - i - 1; j++) {
                if (_arr[j] > _arr[j + 1]) {
                    sorted = false;
                    (_arr[j], _arr[j + 1]) = (_arr[j + 1], _arr[j]);
                }
            }
            if(sorted){
                break;
            }
            
        }
        
        return _arr;
    }

    function removeDuplicates(uint[] memory _arr) public pure returns (uint[] memory) { 
        
        uint[] memory uniqueArr = new uint[](_arr.length);
        uint uniqueCount = 0;
        
        for (uint i = 0; i < _arr.length; i++) {
            bool isDuplicate = false;
            
            for (uint j = 0; j < uniqueCount; j++) {
                if (_arr[i] == uniqueArr[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            
            if (!isDuplicate) {
                uniqueArr[uniqueCount] = _arr[i];
                uniqueCount++;
            }
        }
        
        // Resize the uniqueArr to the actual number of unique elements
        uint[] memory result = new uint[](uniqueCount);
        for (uint i = 0; i < uniqueCount; i++) {
            result[i] = uniqueArr[i];
        }
        
        return result;
    }
}

contract Test {
    uint[] data;
    constructor() {
        data.push(5);
        data.push(4);
        data.push(3);
        data.push(2);
        data.push(1);
        data.push(5);
        data.push(4);
    }

    function getSort() public returns (uint[] memory) {

        sortAndUnique.sort(data);
        return data;

    }

    function getUnique() public returns (uint[] memory){
       uint[] memory uniqueArray = sortAndUnique.removeDuplicates(data);
       data = uniqueArray;
       return data;
    }


}
