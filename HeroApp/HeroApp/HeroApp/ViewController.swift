//
//  ViewController.swift
//  heroApp
//
//  Created by Тулепберген Анель  on 27.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

// ? Это значит, что переменная может содержать значение или быть пустым (nil).
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

    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroPowerstats: UILabel!
    @IBOutlet private weak var heroAppearance: UILabel!
    @IBOutlet private weak var heroBiography: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!

    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    private var heroes: [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    
    @IBAction private func heroRollDidTap(_ sender: UIButton) {
        // Анимация кнопки
        UIView.animate(withDuration: 0.2,
                       animations: {
                           sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
        }
//Если герои ещё не загружены, вызывает функцию fetchHero() для загрузки данных.
        if heroes.isEmpty {
            fetchHero()
        }
//Если герои уже загружены, выбирает случайного героя из массива heroes и вызывает функцию configure(hero:) для обновления интерфейса.
        else {
            let randomHero = heroes.randomElement()!
            configure(hero: randomHero)
        }
    }
    
    
//это вообще не используется используется async/await
    private func fetchHeroAsync() async {
        let result = await AF.request(api).serializingDecodable([Hero].self).result
        switch result {
        case .success(let heroes):
            self.heroes = heroes
        case .failure(let error):
            print("Error fetching heroes: \(error)")
        }
    }

//Загрузка всех героев через Alamofire (обычный способ без async/await).
    private func fetchHero() {
        AF.request(api).responseDecodable(of: [Hero].self) { response in
            switch response.result {
            case .success(let heroes):
                self.heroes = heroes
            case .failure(let error):
                print("Error fetching heroes: \(error)")
            }
        }
    }

    private func configure(hero: Hero) {
        //Сначала делает изображение героя прозрачным (скрывает его с анимацией).
        UIView.animate(withDuration: 0.3, animations: {
            self.heroImage.alpha = 0 // Скрыть текущее изображение
        }) { _ in
            //вызывает updateUI(with:), чтобы обновить данные героя на экране.
            self.updateUI(with: hero)

            // Плавное появление нового изображения (После этого снова показывает изображение с анимацией.)
            UIView.animate(withDuration: 0.3) {
                self.heroImage.alpha = 1
            }
        }
    }

    private func updateUI(with hero: Hero) {
        // Name
        heroName.text = hero.name

        // Если данные есть, отображаются: интеллект, сила, скорость.
        if let powerstats = hero.powerstats {
            heroPowerstats.text = """
            Intelligence: \(powerstats.intelligence ?? 0)
            Strength: \(powerstats.strength ?? 0)
            Speed: \(powerstats.speed ?? 0)
            """
        }
        //Если данных нет, пишется "Powerstats not available."
        else {
            heroPowerstats.text = "Powerstats not available."
        }

        // Appearance
        if let appearance = hero.appearance {
            let height = appearance.height?.joined(separator: ", ") ?? "Unknown"
            heroAppearance.text = """
            Gender: \(appearance.gender ?? "Unknown")
            Race: \(appearance.race ?? "Unknown")
            Height: \(height)
            Eye Color: \(appearance.eyeColor ?? "Unknown")
            """
        } else {
            heroAppearance.text = "Appearance not available."
        }

        // Biography
        if let biography = hero.biography {
            heroBiography.text = """
            Full Name: \(biography.fullName ?? "Unknown")
            Alter Egos: \(biography.alterEgos ?? "None")
            Publisher: \(biography.publisher ?? "Unknown")
            Place of Birth: \(biography.placeOfBirth ?? "Unknown")
            """
        } else {
            heroBiography.text = "Biography not available."
        }

        // проверяет, доступна ли ссылка на изображение героя, и, если она есть, загружает это изображение.
        if let imageUrl = hero.images?.sm, let url = URL(string: imageUrl) {
            heroImage.kf.setImage(with: url)
        }
        //Если же ссылки на изображение нет, устанавливается изображение-заполнитель (placeholder).
        else {
            heroImage.image = UIImage(named: "placeholder") // Placeholder image
        }
    }
}

