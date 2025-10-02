//
//  main.swift
//  task1
//
//  Created by Анель Тулепберген on 09.09.2024.
//

// 1
var firstName: String = "Anel"
var lastName: String = "Tulepbergen"
var age: Int = 18
var birthYear: Int = 2005
var isStudent: Bool = true
var height: Double = 1.64
var nationality: String = "Kazakh"
var 🏘: String = "Almaty"
var university: String = "KBTU 🏛"
var studentYear: Int = 3
let currentYear: Int = 2024
age = currentYear - birthYear  
let futureGoals: String = "In the future, I want to become a professional iOS developer. 👩‍💻📱"


// 2
var hobby: String = "watching movies"
var favouriteGenre: String = "action"
var 🎬: String = "Kill Bill"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 7
var entertaingHobby: Bool = true

var lifeStory = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am a Kazakh girl, originally from \(🏘). Currently, I am a student in my \(studentYear) year at \(university). I enjoy \(hobby), which is entertaining hobby. My favourite genre of a film is \(favouriteGenre). Therefore, my favourite movie is \(🎬). I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). \(futureGoals)
"""

print(lifeStory)
