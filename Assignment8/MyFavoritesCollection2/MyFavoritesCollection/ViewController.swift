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
        Car(title: "Mercedes", imageName: UIImage(named: "mercedes-e-class")!, rating: "Rating: 5", description: "A luxury sedan known for its elegance and comfort.", engineType: "Engine: V6 Turbocharged"),
        Car(title: "Audi", imageName: UIImage(named: "audi")!, rating: "Rating: 5", description: "A premium car offering advanced technology and design.", engineType: "Engine: Inline-4 Turbocharged"),
        Car(title: "Bentley", imageName: UIImage(named: "bentley")!, rating: "Rating: 7", description: "An ultra-luxury car with unmatched craftsmanship.", engineType: "Engine: V8 Twin-Turbo"),
        Car(title: "BMW", imageName: UIImage(named: "bmw")!, rating: "Rating: 6", description: "A sporty yet elegant car with excellent performance.", engineType: "Engine: Inline-6 Turbocharged"),
        Car(title: "Ferrari", imageName: UIImage(named: "ferrari")!, rating: "Rating: 9", description: "A high-performance sports car with iconic style.", engineType: "Engine: V12 Naturally Aspirated"),
        Car(title: "Hyundai", imageName: UIImage(named: "hyundai")!, rating: "Rating: 4", description: "A reliable car with great value for money.", engineType: "Engine: Inline-4"),
        Car(title: "Kia", imageName: UIImage(named: "kia")!, rating: "Rating: 4", description: "A practical car with a focus on affordability.", engineType: "Engine: Inline-4"),
        Car(title: "Lexus", imageName: UIImage(named: "lexus")!, rating: "Rating: 5", description: "A luxurious car with advanced features and comfort.", engineType: "Engine: V6 Hybrid"),
        Car(title: "Porsche", imageName: UIImage(named: "porsche")!, rating: "Rating: 7", description: "A high-performance sports car with sleek design.", engineType: "Engine: Flat-6 Turbocharged"),
        Car(title: "Range Rover", imageName: UIImage(named: "range_rover")!, rating: "Rating: 6", description: "A luxury SUV with off-road capability.", engineType: "Engine: V8 Supercharged"),

    ]
    
    private var selectedCar: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destSVC = segue.destination as? SecondViewController else {
            return
        }
        destSVC.configure(with: selectedCar)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCar = data[indexPath.row]
        performSegue(withIdentifier: "detailedCar", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
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
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    
}

