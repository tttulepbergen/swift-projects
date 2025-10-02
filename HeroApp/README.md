# HeroApp 🦸‍♂️🦸‍♀️

## 🚀 Overview
The **Superhero Randomizer App** is an iOS application that fetches and displays random superhero information from the SuperHero API. The app uses **Alamofire** for networking and **Kingfisher** to handle image downloads. Each time the user taps the "Randomize" button, the app displays details about a random superhero, including their name, intelligence, strength, speed, and an image.

## 🚀 Features
- **Random Superhero**: Fetches and displays a random superhero each time the user taps the "Randomize" button.
- **Superhero Details**: Shows detailed information about the superhero, including at least 10 attributes (e.g., name, full name, intelligence, strength, speed).
- **Image Display**: Displays the superhero’s image using the Kingfisher package.
- **User Interface**: Clean, intuitive UI using UIKit with Auto Layout to ensure the app works on all devices and orientations.

## 🎯 Requirements
- **Xcode** 15.4 or later
- **Swift 5.x**
- **iOS 14.0+**
- **Alamofire** for networking
- **Kingfisher** for image handling

## 📲 Usage

1. Launch the app on a simulator or a real device.
2. Tap the **"Randomize"** button to fetch and display a random superhero's details.
3. The superhero’s details, including their image, will be displayed in the app.

## 📚 Code Structure
- **Superhero.swift**: A model for storing superhero data.
- **NetworkManager.swift**: Handles all networking tasks using Alamofire to fetch data from the SuperHero API.
- **ViewController.swift**: The main view controller that manages the UI, including the button tap logic and display of superhero information.

## ⚠️ Error Handling
The app gracefully handles network errors and JSON parsing errors. If there is an issue with fetching data or parsing the response, the user will see an alert informing them of the error.

## 🎬 Optional Features (Bonus)
- **Animations**: Transitions between superheroes are animated for a smoother user experience.

## 📱 Screenshots and Video
<img src="https://github.com/user-attachments/assets/873d9d73-8e13-45a6-9838-998614d50f42" width="300" alt="Simulator Screenshot">

<video src="https://github.com/user-attachments/assets/4e3907ab-04e3-4444-9718-bc1e3df41de9.mp4" controls width="300"></video>



**Explore the superhero world and enjoy discovering your favorite heroes!**  
