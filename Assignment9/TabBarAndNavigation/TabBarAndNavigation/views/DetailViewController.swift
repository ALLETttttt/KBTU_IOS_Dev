//
//  DetailViewController.swift
//  TabBarAndNavigation
//
//  Created by Бакдаулет on 15.11.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var imageLabel: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
//  Film fields
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    
//  Music fields
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var descriptionMusicLabel: UILabel!
    @IBOutlet private weak var albumLabel: UILabel!
    
//  Book Fields
    @IBOutlet private weak var descriptionBookLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    
    
    private var inputModelFilm: Film?
    private var inputModelMusic: Music?
    private var inputModelBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (inputModelFilm != nil) {
            imageLabel.image = inputModelFilm?.imageName
            titleLabel.text = inputModelFilm?.title
            genreLabel.text = inputModelFilm?.genre
            descriptionLabel.text = inputModelFilm?.description
            popularityLabel.text = inputModelFilm?.popularity
            
        } else if (inputModelMusic != nil) {
            imageLabel.image = inputModelMusic?.imageName
            titleLabel.text = inputModelMusic?.title
            artistLabel.text = inputModelMusic?.artist
            descriptionMusicLabel.text = inputModelMusic?.description
            albumLabel.text = inputModelMusic?.album
        } else if (inputModelBook != nil) {
            imageLabel.image = inputModelBook?.imageName
            titleLabel.text = inputModelBook?.title
            descriptionBookLabel.text = inputModelBook?.description
            authorLabel.text = inputModelBook?.author
        }
    }
        
    
    func configureFilm(with model: Film?) {
        self.inputModelFilm = model
    }
    
    func configureMusic(with model: Music?) {
        self.inputModelMusic = model
    }
    
    func configureBook(with model: Book?) {
        self.inputModelBook = model
    }
    
}
