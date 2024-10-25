//
//  ViewController.swift
//  MyFavoritesCollection
//
//  Created by Бакдаулет on 25.10.2024.
//

import UIKit

// Model for Book
struct Book {
    let title: String
    let author: String
    let genre: String
    let coverImage: UIImage
}

// ViewController
class ViewController: UIViewController, UICollectionViewDataSource {

    private var collectionView: UICollectionView!
    
    // Data Source: 10 sample books
    private let books: [Book] = [
        Book(title: "1984", author: "George Orwell", genre: "Dystopian", coverImage: UIImage(named: "george")!),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Classic", coverImage: UIImage(named: "george")!),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", coverImage: UIImage(named: "george")!),
        Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", coverImage: UIImage(named: "george")!),
        Book(title: "Moby Dick", author: "Herman Melville", genre: "Adventure", coverImage: UIImage(named: "george")!),
        Book(title: "War and Peace", author: "Leo Tolstoy", genre: "Historical", coverImage: UIImage(named: "george")!),
        Book(title: "The Odyssey", author: "Homer", genre: "Epic", coverImage: UIImage(named: "george")!),
        Book(title: "Hamlet", author: "William Shakespeare", genre: "Tragedy", coverImage: UIImage(named: "george")!),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Coming-of-age", coverImage: UIImage(named: "george")!),
        Book(title: "Brave New World", author: "Aldous Huxley", genre: "Science Fiction", coverImage: UIImage(named: "george")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Layout for UICollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        
        // UICollectionView Setup
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(BookCell.self, forCellWithReuseIdentifier: "BookCell")
        view.addSubview(collectionView)
    }

    // UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCell
        let book = books[indexPath.item]
        cell.configure(with: book)
        return cell
    }
}

// Custom UICollectionViewCell for Book
class BookCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let genreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Image View Setup
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 90)
        contentView.addSubview(imageView)
        
        // Title Label Setup
        titleLabel.frame = CGRect(x: 0, y: 95, width: 100, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(titleLabel)
        
        // Author Label Setup
        authorLabel.frame = CGRect(x: 0, y: 115, width: 100, height: 15)
        authorLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(authorLabel)
        
        // Genre Label Setup
        genreLabel.frame = CGRect(x: 0, y: 130, width: 100, height: 15)
        genreLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(genreLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure cell with book data
    func configure(with book: Book) {
        imageView.image = book.coverImage
        titleLabel.text = book.title
        authorLabel.text = book.author
        genreLabel.text = book.genre
    }
}



