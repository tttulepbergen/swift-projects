## Hero Randomizer App 🦸‍♂️🦸‍♀️

The **Hero Randomizer App** is an iOS application that lets users explore information about random superheroes, including their images, power stats, biography, and appearance. All data is fetched from the Superhero API.

---

### 📱 Screenshots and Video

<img src="https://github.com/user-attachments/assets/946d46f5-b8c6-4261-9bc1-11f8246d3633" width="300" alt="Simulator Screenshot">
<video src="https://github.com/user-attachments/assets/e416df84-bf88-4aac-b3ac-10e1e0349575.mp4" controls width="300"></video>

---

### 🚀 Features

- Fetch data for a random superhero.  
- Display hero's name, power stats (intelligence, strength, speed), biography, and appearance.  
- Smooth image loading with fade-in animation.  
- Clean and minimalist UI animations.  

---

### ⚙️ Technologies

- **UIKit**: For user interface and animations.  
- **URLSession**: For network data fetching.  
- **JSONDecoder**: For decoding JSON data into Swift structures.  
- **UIView.animate**: For smooth interface animations.  

---

### 📋 Project Structure

**Main components**:  

1. **Hero Struct**: Defines the superhero data structure, including:  
   - `name`: Hero's name.  
   - `powerstats`: Hero's characteristics.  
   - `appearance`: Hero's physical traits (height, eye color, etc.).  
   - `biography`: Hero's biography details.  
   - `images`: URL for the hero's image.  

2. **ViewController**: Main view controller containing:  
   - UI components (image view, labels).  
   - Logic for data fetching and display.  
   - Button and image animations.  

---

### 🧩 API Usage Example

The app uses the **Superhero API** to fetch hero data.  

**Example URL**:  
```  
https://akabab.github.io/superhero-api/api/id/1.json  
```  

**Response structure**:  
```json
{
  "id": 1,
  "name": "A-Bomb",
  "powerstats": {
    "intelligence": 38,
    "strength": 100,
    "speed": 17
  },
  "appearance": {
    "gender": "Male",
    "race": "Human",
    "height": ["6'8", "203 cm"],
    "eyeColor": "Yellow"
  },
  "biography": {
    "fullName": "Richard Milhouse Jones",
    "alterEgos": "No alter egos found",
    "publisher": "Marvel Comics",
    "placeOfBirth": "Scarsdale, Arizona"
  },
  "images": {
    "sm": "https://path.to/image.jpg"
  }
}
```

---

### 📖 Code Highlights

- **Smooth animations**: Buttons and images feature animations for better user experience.  
- **Error handling**: Displays network or decoding errors in the UI and logs them to the console.  
- **Asynchronous loading**: Utilizes `URLSession` for network requests and updates the UI on `DispatchQueue.main`.  

---

## App Creator


|       Name        |    ID     |
|-------------------|-----------|
| Tulepbergen Anel  | 22B030602 |

---

**Explore the superhero world and enjoy discovering your favorite heroes!**  
