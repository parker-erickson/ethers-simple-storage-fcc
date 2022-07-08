// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    //boolean, uint, int, address, bytes
//     uint favoriteNumber = 123;
//     bool hasFavoriteNumber = true;
//     string favoriteNumberInText = "Five";
//     int256 favoriteInt = -5;
//     address myAddress = 0x8EdD7E564Fe6F3f0d4c71Ac604cCa5a06EA7a44A;
//     bytes32 favoriteBytes = "cat";


    // this gets initialized to zero
    uint256 public favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        people.push(newPerson);

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

//0xd9145CCE52D386f254917e481eB44e9943F39138