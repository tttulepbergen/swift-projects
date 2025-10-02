import UIKit

struct Hero: Decodable {
   let name: String
   let powerstats: Powerstats?
   let appearance: Appearance?
   let biography: Biography?
   let images: Image?
   
   struct Powerstats: Decodable {
       let intelligence: Int?
       let strength: Int?
       let speed: Int?
   }
   
   struct Appearance: Decodable {
       let gender: String?
       let race: String?
       let height: [String]?
       let eyeColor: String?
   }
   
   struct Biography: Decodable {
       let fullName: String?
       let alterEgos: String?
       let publisher: String?
       let placeOfBirth: String?
   }
   
   struct Image: Decodable {
       let sm: String?
   }
}

class ViewController: UIViewController {

   @IBOutlet private weak var heroImage: UIImageView!
   @IBOutlet private weak var heroName: UILabel!
   @IBOutlet private weak var heroPowerstats: UILabel!
   @IBOutlet private weak var heroAppearance: UILabel!
   @IBOutlet private weak var heroBiography: UILabel!

   override func viewDidLoad() {
       super.viewDidLoad()
   }

    @IBAction func heroRollDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       animations: {
                           sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
        }
        
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }


   private func fetchHero(by id: Int) {
       let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
       guard let url = URL(string: urlString) else { return }

       URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
           guard let self = self else { return }
           if self.handleErrorIfNeeded(error: error) { return }
           guard let data else { return }
           self.handleHeroData(data: data)
       }.resume()
   }

   private func handleHeroData(data: Data) {
       do {
           let hero = try JSONDecoder().decode(Hero.self, from: data)
           DispatchQueue.main.async {
               self.updateUI(with: hero)
           }
       } catch {
           DispatchQueue.main.async {
               self.showError(error: error)
           }
       }
   }

   private func updateUI(with hero: Hero) {
       heroName.text = "Name: \(hero.name)"
       
       if let powerstats = hero.powerstats {
           heroPowerstats.text = """
           Intelligence: \(powerstats.intelligence ?? 0)
           Strength: \(powerstats.strength ?? 0)
           Speed: \(powerstats.speed ?? 0)
           """
       } else {
           heroPowerstats.text = "No powerstats available"
       }

       if let appearance = hero.appearance {
           heroAppearance.text = """
           Gender: \(appearance.gender ?? "Unknown")
           Race: \(appearance.race ?? "Unknown")
           Height: \(appearance.height?.joined(separator: ", ") ?? "N/A")
           Eye Color: \(appearance.eyeColor ?? "Unknown")
           """
       } else {
           heroAppearance.text = "No appearance data available"
       }

       if let biography = hero.biography {
           heroBiography.text = """
           Full Name: \(biography.fullName ?? "Unknown")
           Alter Egos: \(biography.alterEgos ?? "Unknown")
           Publisher: \(biography.publisher ?? "Unknown")
           Place of Birth: \(biography.placeOfBirth ?? "Unknown")
           """
       } else {
           heroBiography.text = "No biography data available"
       }

       loadImage(from: hero.images?.sm)
   }

    private func loadImage(from urlString: String?) {
        // Убираем текущее изображение и делаем его прозрачным
        heroImage.image = nil
        heroImage.alpha = 0
        
        guard let urlString, let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let self = self, let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                // Устанавливаем новое изображение
                self.heroImage.image = image
                
                // Анимация плавного появления
                UIView.animate(withDuration: 0.5) {
                    self.heroImage.alpha = 1
                }
            }
        }.resume()
    }


   private func showError(error: Error) {
       heroName.text = "Error"
       heroPowerstats.text = nil
       heroAppearance.text = nil
       heroBiography.text = nil
       heroImage.image = nil

       print("Error decoding hero data: \(error.localizedDescription)")
   }

   private func handleErrorIfNeeded(error: Error?) -> Bool {
       guard let error else { return false }
       print("Network error: \(error.localizedDescription)")
       return true
   }
}
