//
//  ViewController.swift
//  MyFavoritesCollection
//
//  Created by Тулепберген Анель  on 25.10.2024.
//

import UIKit

struct Movie {
    let title: String
    let year: Int
    let genre: String
    let country: String
    let image: UIImage
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let movies = [
        Movie(title: "Inglourious Basterds", year: 2009, genre: "War, Drama, Action", country: "USA", image: UIImage.basterds),
        Movie(title: "No Country for Old Men", year: 2007, genre: "Crime, Drama, Thriller", country: "USA", image: UIImage.country),
        Movie(title: "All Quiet on the Western Front", year: 2022, genre: "War, Drama, Action", country: "Germany", image: UIImage.front),
        Movie(title: "The Fast and The Furious: Tokyo Drift", year: 2006, genre: "Action, Crime, Thriller", country: "Japan", image: UIImage.drift),
        Movie(title: "1917", year: 2019, genre: "War, Drama, Thriller", country: "UK", image: UIImage.sam),
        Movie(title: "Incendies", year: 2010, genre: "Drama, Mystery, War", country: "Canada", image: UIImage.incendies),
        Movie(title: "Kill Bill: Vol. 1", year: 2003, genre: "Action, Crime, Thriller", country: "USA", image: UIImage.bill),
        Movie(title: "Blade Runner 2049", year: 2017, genre: "Sci-Fi, Drama, Mystery", country: "USA", image: UIImage.runner),
        Movie(title: "Drive", year: 2011, genre: "Crime, Drama, Thriller", country: "USA", image: UIImage.drive),
        Movie(title: "The Big Lebowski", year: 1998, genre: "Comedy, Crime", country: "USA", image: UIImage.lebowski)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let movie = movies[indexPath.row]
        
        cell.movieTitle.text = movie.title
        cell.movieImage.image = movie.image
        cell.movieGenre.text = movie.genre
        cell.movieYear.text = String(movie.year)
        cell.movieCountry.text = movie.country
        
        return cell
    }
}

