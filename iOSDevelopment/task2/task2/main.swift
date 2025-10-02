//
//  main.swift
//  task2
//
//  Created by Тулепберген Анель  on 16.09.2024.
//


// Easy Tasks

// 1
var fiveFruits: [String] = ["banana", "apple", "cherry", "grapefruit", "grape"]

print(fiveFruits[2])

// 2
var favouriteNumbers: Set<Int> = [1, 2, 3, 4, 5]

favouriteNumbers.insert(9)

print(favouriteNumbers)

// 3
var programmingLanguages: [String: Int] = [
    "C++": 1985,
    "Python": 1991,
    "JavaScript": 1995,
    "Swift": 2014
]

print(programmingLanguages["Swift"] ?? "Year not found")  

// 4
var colors = ["white", "silver", "black", "gold"]

colors[1] = "purple"

print(colors)


// Medium Tasks

// 1
var firstSet: Set<Int> = [1, 2, 3, 4]

var secondSet: Set<Int> = [3, 4, 5, 6]

print(firstSet.intersection(secondSet))

// 2
var studentScores: [String: Int] = [
    "Bob": 85,
    "Patric": 90,
    "Sandy": 75
]
studentScores.updateValue(95, forKey: "Bob")

print(studentScores)

// 3
let array1 = ["apple", "banana"]

let array2 = ["cherry", "date"]

let result = array1 + array2
print(result)


// Hard Tasks

// 1
var countryPopulations: [String: Int] = [
    "Germany": 84_000_000,
    "Turkey": 89_000_000,
    "Kazakhstan": 19_000_000,
    "China": 1_400_000_000,
    "Italy": 59_000_000,
    "USA": 331_000_000
]
countryPopulations["South Korea"] = 52_000_000

print(countryPopulations)

// 2
let set1: Set<String> = ["cat", "dog"]

let set2: Set<String> = ["dog", "mouse"]

let unionSet = set1.union(set2)

let finalSet = unionSet.subtracting(set2)

print(finalSet)

// 3
let studentGrades: [String: [Int]] = [
    "Bob": [85, 92, 88, 70],
    "Patric": [78, 81, 84, 67],
    "Sandy": [90, 89, 95, 100]
]

print(studentGrades["Patric"]?[2] ?? "Grade not found")
