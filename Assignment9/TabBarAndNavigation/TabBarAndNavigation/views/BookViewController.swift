//
//  BookViewController.swift
//  TabBarAndNavigation
//
//  Created by Бакдаулет on 15.11.2024.
//

import UIKit

class BookViewController: UIViewController {
    
    @IBOutlet private weak var tableViewBook: UITableView!
    
    
    let data: [Book] = [
        Book(
            title: "Book of Avenger",
            imageName: UIImage(named: "b1")!,
            description: "A thrilling tale of Earth's mightiest heroes joining forces to save the world.", author: "Stan Lee"
        ),
        Book(
            title: "Journey to the Unknown",
            imageName: UIImage(named: "b3")!,
            description: "An adventurous story about a young wizard discovering the power of friendship.", author: "J.K. Rowling"
        ),
        Book(
            title: "The Art of War",
            imageName: UIImage(named: "b2")!,
            description: "An ancient Chinese military treatise offering timeless strategies for success.", author: "Sun Tzu"
        ),
        Book(
            title: "1984",
            imageName: UIImage(named: "b4")!,
            description: "A dystopian novel exploring themes of surveillance, totalitarianism, and rebellion.", author: "George Orwell"
        ),
        Book(
            title: "The Great Gatsby",
            imageName: UIImage(named: "b5")!,
            description: "A tragic story of love, wealth, and the pursuit of the American Dream.", author: "F. Scott Fitzgerald"
        ),
        Book(
            title: "To Kill a Mockingbird",
            imageName: UIImage(named: "b6")!,
            description: "A compelling novel addressing racial injustice and moral growth in the Deep South.", author: "Harper Lee"
        ),
        Book(
            title: "Pride and Prejudice",
            imageName: UIImage(named: "b7")!,
            description: "A classic romantic tale that critiques societal expectations and gender roles.", author: "Jane Austen"
        )
    ]
    
    private var selectedBook: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBook.dataSource = self
        tableViewBook.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destDVC = segue.destination as? DetailViewController else {
            return
        }
        destDVC.configureBook(with: selectedBook)
    }
    
}

extension BookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = data[indexPath.row]
        performSegue(withIdentifier: "bookSegue", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let books = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        cell.imageLabel.image = books.imageName
        cell.titleLabel.text = books.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

