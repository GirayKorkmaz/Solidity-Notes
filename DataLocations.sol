// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

struct Student {
    uint age;
    uint16 score;
    string name;
}

contract School {
    uint256 totalStudents = 0; // storage
    mapping(uint256 => Student) students; // storage

    function addStudent(uint8 age, uint16 score, string calldata name) external {
        uint256 currentID = totalStudents++;
        students[currentID] = Student(age, score, name);
        }

    function changeStudentInfo(uint256 id,string calldata newName,uint8 newAge,uint16 newScore) external{
        Student storage currentStudent =students[id]; 

        currentStudent.name = newName;
        currentStudent.age = newAge;
        currentStudent.score = newScore;
    }
    function getStudentName(uint256 id)external view  returns(string memory){
        return students[id].name;
    }
}