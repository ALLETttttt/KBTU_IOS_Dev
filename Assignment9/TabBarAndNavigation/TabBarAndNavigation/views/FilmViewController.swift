//
//  ViewController.swift
//  TabBarAndNavigation
//
//  Created by Бакдаулет on 15.11.2024.
//

import UIKit

class FilmViewController: UIViewController {
    
    @IBOutlet private weak var tableViewFilm: UITableView!
    
    let data: [Film] = [
        Film(
            title: "Avengers",
            imageName: UIImage(named: "avengers")!,
            genre: "Genre: Action", // Added "Genre:"
            description: "An ensemble of superheroes comes together to save the world from imminent threats.",
            popularity: "Popularity: 95" // Added "Popularity:"
        ),
        Film(
            title: "Inception",
            imageName: UIImage(named: "increption")!,
            genre: "Genre: Sci-Fi", // Added "Genre:"
            description: "A skilled thief leads a team into people's dreams to steal their secrets.",
            popularity: "Popularity: 90" // Added "Popularity:"
        ),
        Film(
            title: "The Godfather",
            imageName: UIImage(named: "godfather")!,
            genre: "Genre: Crime", // Added "Genre:"
            description: "The aging patriarch of an organized crime dynasty transfers control to his reluctant son.",
            popularity: "Popularity: 98" // Added "Popularity:"
        ),
        Film(
            title: "The Dark Knight",
            imageName: UIImage(named: "dark")!,
            genre: "Genre: Action", // Added "Genre:"
            description: "Batman faces the Joker, a criminal mastermind who seeks to plunge Gotham City into anarchy.",
            popularity: "Popularity: 97" // Added "Popularity:"
        ),
        Film(
            title: "Pulp Fiction",
            imageName: UIImage(named: "pulp")!,
            genre: "Genre: Crime", // Added "Genre:"
            description: "Interwoven stories of crime and redemption in Los Angeles.",
            popularity: "Popularity: 92" // Added "Popularity:"
        ),
        Film(
            title: "Forrest Gump",
            imageName: UIImage(named: "forrest")!,
            genre: "Genre: Drama", // Added "Genre:"
            description: "The life journey of Forrest Gump, a man with a low IQ but good intentions.",
            popularity: "Popularity: 94" // Added "Popularity:"
        ),
        Film(
            title: "The Matrix",
            imageName: UIImage(named: "matrix")!,
            genre: "Genre: Sci-Fi", // Added "Genre:"
            description: "A hacker discovers the reality he lives in is a simulated reality created by machines.",
            popularity: "Popularity: 96" // Added "Popularity:"
        )
    ]
    
    private var selectedFilm: Film?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFilm.dataSource = self
        tableViewFilm.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destDVC = segue.destination as? DetailViewController else {
            return
        }
        destDVC.configureFilm(with: selectedFilm)
    }
    
}

extension FilmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFilm = data[indexPath.row]
        performSegue(withIdentifier: "filmSegue", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FilmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let films = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as! FilmTableViewCell
        cell.imageLabel.image = films.imageName
        cell.titleLabel.text = films.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

