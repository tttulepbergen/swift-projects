//
//  main.swift
//  task3
//
//  Created by Тулепберген Анель  on 21.09.2024.
//

import Foundation

// 1
for x in 1...100 {
    if x % 3 == 0 && x % 5 == 0 {
        print("FizzBuzz")
    } else if x % 3 == 0 {
        print("Fizz")
    } else if x % 5 == 0 {
        print("Buzz")
    } else {
        print(x)
    }
}

// 2
func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 { return false }
    }
    return true
}
for i in 1...100 {
    if isPrime(i) {
        print(i)
    }
}

// 3
// Celsius to Fahrenheit and Kelvin
func convertFromCelsius(_ celsius: Double) {
    let fahrenheit = (celsius * 9/5) + 32
    let kelvin = celsius + 273.15
    print("\(celsius)°C is equivalent to \(fahrenheit)°F and \(kelvin)K")
}

// Fahrenheit to Celsius and Kelvin
func convertFromFahrenheit(_ fahrenheit: Double) {
    let celsius = (fahrenheit - 32) * 5/9
    let kelvin = (fahrenheit + 459.67) * 5/9
    print("\(fahrenheit)°F is equivalent to \(celsius)°C and \(kelvin)K")
}

// Kelvin to Celsius and Fahrenheit
func convertFromKelvin(_ kelvin: Double) {
    let celsius = kelvin - 273.15
    let fahrenheit = (kelvin * 9/5) - 459.67
    print("\(kelvin)K is equivalent to \(celsius)°C and \(fahrenheit)°F")
}

// take input from user
func temperatureConverter() {
    print("Enter the temperature value:")
    guard let input = readLine(), let temperature = Double(input) else {
        print("Invalid input. Please enter a valid number.")
        return
    }

    print("Enter the unit of the temperature (C, F, K):")
    guard let unit = readLine()?.uppercased(), unit == "C" || unit == "F" || unit == "K" else {
        print("Invalid unit. Please enter C, F, or K.")
        return
    }

    switch unit {
    case "C":
        convertFromCelsius(temperature)
    case "F":
        convertFromFahrenheit(temperature)
    case "K":
        convertFromKelvin(temperature)
    default:
        print("error!")
    }
}
temperatureConverter()



// 4
var shoppingList = [String]()

func showMenu() {
    print("""
    1.Add Item
    2.Remove Item
    3.View List
    4.Exit
    """)
}
var isRunning = true
while isRunning {
    showMenu()
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter item to add:")
            if let item = readLine() {
                shoppingList.append(item)
            }
        case "2":
            print("Enter item to remove:")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)
            }
        case "3":
            print("Current List: \(shoppingList)")
        case "4":
            isRunning = false
        default:
            print("Invalid choice")
        }
    }
}


//5
// clean up punctuation from the sentence
func cleanSentence(_ sentence: String) -> String {
    let punctuationCharacters = CharacterSet.punctuationCharacters
    let cleanedSentence = sentence.components(separatedBy: punctuationCharacters).joined()
    return cleanedSentence
}

// Function to count the frequency of words in a sentence
func countWordFrequency(in sentence: String) -> [String: Int] {
    // Clean the sentence of punctuation and convert it to lowercase
    let cleanedSentence = cleanSentence(sentence).lowercased()
    
    // Split the sentence into words
    let words = cleanedSentence.split(separator: " ").map { String($0) }
    
    // Dictionary to store word-frequency pairs
    var wordFrequency: [String: Int] = [:]
    
    // Loop through each word and update its frequency in the dictionary
    for word in words {
        wordFrequency[word, default: 0] += 1
    }
    
    return wordFrequency
}

// Function to display the word frequencies
func displayWordFrequencies(_ wordFrequency: [String: Int]) {
    print("\nWord Frequencies:")
    for (word, count) in wordFrequency.sorted(by: { $0.key < $1.key }) {
        print("\(word): \(count)")
    }
}

// take input and display the word frequencies
func wordFrequencyCounter() {
    print("Enter a sentence:")
    
    if let sentence = readLine(), !sentence.isEmpty {
        let wordFrequency = countWordFrequency(in: sentence)
        displayWordFrequencies(wordFrequency)
    } else {
        print("Invalid input. Please enter a non-empty sentence.")
    }
}

// Start the word frequency counter
wordFrequencyCounter()



// 6
func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var sequence = [0, 1]
    
    while sequence.count < n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    
    return Array(sequence.prefix(n))
}

// Example usage
print(fibonacci(10))


// 7

// Function to calculate and display student grades
func gradeCalculator(students: [String: Int]) {
    
    let total = students.values.reduce(0, +)
    
    let average = total / students.count
    let highest = students.values.max() ?? 0
    let lowest = students.values.min() ?? 0
    
    // Displaying results
    print("Average Score: \(average)")
    print("Highest Score: \(highest)")
    print("Lowest Score: \(lowest)")
    
    // each student's score and check if they're above or below average
    for (name, score) in students {
        let status = score >= average ? "Above Average" : "Below Average"
        print("\(name) - \(score) (\(status))")
    }
}

// Function to read user input and collect student scores
func inputStudentGrades() {
    var students: [String: Int] = [:]
    
    // Continue to read input until the user decides to stop
    while true {
        // Prompt for student name
        print("Enter student's name (or type 'done' to finish): ", terminator: "")
        guard let name = readLine(), name.lowercased() != "done" else {
            break // Exit loop if user types "done"
        }
        
        // Prompt for student score
        print("Enter score for \(name): ", terminator: "")
        if let scoreString = readLine(), let score = Int(scoreString) {
            students[name] = score // Add student and score to the dictionary
        } else {
            print("Invalid score. Please enter a numeric value.")
        }
    }
    
    // Call the grade calculator with the collected student data
    gradeCalculator(students: students)
}

// Execute the function to gather input and calculate grades
inputStudentGrades()



// 8
// Function to determine if a string is a palindrome
func isPalindrome(_ text: String) -> Bool {
    // Clean the input text: lowercased and only letters
    let cleanedText = text.lowercased().filter { $0.isLetter }
    // Check if cleaned text is equal to its reverse
    return cleanedText == String(cleanedText.reversed())
}

// Function to read user input and check for palindrome
func checkPalindrome() {
    // Prompt the user for input
    print("Enter a string to check if it's a palindrome:")
    
    // Read the user input from the console
    if let inputText = readLine() {
        // Check if the input is a palindrome and print the result
        if isPalindrome(inputText) {
            print("The input is a palindrome.")
        } else {
            print("The input is not a palindrome.")
        }
    } else {
        print("Invalid input.")
    }
}

// Call the function to execute
checkPalindrome()


// 9
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}
func divide(_ a: Double, _ b: Double) -> Double? {
    return b == 0 ? nil : a / b
}
var continueCalculation = true
while continueCalculation {
    print("Enter first number:")
    if let firstNumber = Double(readLine() ?? "") {
        print("Enter second number:")
        if let secondNumber = Double(readLine() ?? "") {
            print("Choose operation (+, -, *, /):")
            if let operation = readLine() {
                switch operation {
                case "+":
                    print("Result: \(add(firstNumber, secondNumber))")
                case "-":
                    print("Result: \(subtract(firstNumber, secondNumber))")
                case "*":
                    print("Result: \(multiply(firstNumber, secondNumber))")
                case "/":
                    if let result = divide(firstNumber, secondNumber) {
                        print("Result: \(result)")
                    } else {
                        print("Error: Division by zero")
                    }
                default:
                    print("Invalid operation")
                }
            }
        }
    }

    print("Do you want to perform another calculation? (y/n)")
    continueCalculation = readLine()?.lowercased() == "y"
}


// 10
func uniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = []  // set to store unique characters
    
    for char in text {
        // If the character is already in the set, return false
        if seenCharacters.contains(char) {
            return false // duplicate character found
        }
        // add the character to the set
        seenCharacters.insert(char)
    }
    
    // if all characters unique
    return true
}

func uniqueCharactersFromInput() {
    // ask user for input
    print("Please, enter a string!:")
    
    if let inputText = readLine() {
        if uniqueCharacters(inputText) {
            print("Unique characters!")
        } else {
            print("Duplicate characters!")
        }
    } else {
        print("Input is not valid!")
    }
}
// call the function
uniqueCharactersFromInput()


