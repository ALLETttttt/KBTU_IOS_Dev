//
//  ViewController.swift
//  MyFavoritesCollection
//
//  Created by Бакдаулет on 25.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data: [Car] = [
        Car(title: "Mercedes", imageName: UIImage(named: "mercedes-e-class")!, rating: "Rating: 5", description: "", mileadge: "", engineType: ""),
        Car(title: "Audi", imageName: UIImage(named: "audi")!, rating: "Rating: 5", description: "", mileadge: "", engineType: ""),
        Car(title: "Bentley", imageName: UIImage(named: "bentley")!, rating: "Rating: 7", description: "", mileadge: "", engineType: ""),
        Car(title: "BMW", imageName: UIImage(named: "bmw")!, rating: "Rating: 6", description: "", mileadge: "", engineType: ""),
        Car(title: "Ferrari", imageName: UIImage(named: "ferrari")!, rating: "Rating: 9", description: "", mileadge: "", engineType: ""),
        Car(title: "Hyundai", imageName: UIImage(named: "hyundai")!, rating: "Rating: 4", description: "", mileadge: "", engineType: ""),
        Car(title: "Kia", imageName: UIImage(named: "kia")!, rating: "Rating: 4", description: "", mileadge: "", engineType: ""),
        Car(title: "Lexus", imageName: UIImage(named: "lexus")!, rating: "Rating: 5", description: "", mileadge: "", engineType: ""),
        Car(title: "Porsche", imageName: UIImage(named: "porsche")!, rating: "Rating: 7", description: "", mileadge: "", engineType: ""),
        Car(title: "Range Rover", imageName: UIImage(named: "range_rover")!, rating: "Rating: 6", description: "", mileadge: "", engineType: ""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cars = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell
        cell.labelName.text = cars.title
        cell.labelRating.text = cars.rating
        cell.iconImage.image = cars.imageName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

