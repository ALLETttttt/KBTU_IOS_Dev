//
//  SecondViewController.swift
//  MyFavoritesCollection
//
//  Created by Бакдаулет on 10.11.2024.
//

//
//  ViewController.swift
//  MyFavoritesCollection
//
//  Created by Бакдаулет on 25.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var iamgeView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var engineTypeLabel: UILabel!
    
    private var inputModel: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.layer.cornerRadius = 10.0
        titleLabel.text = inputModel?.title
        ratingLabel.text = inputModel?.rating
        iamgeView.image = inputModel?.imageName
        descriptionLabel.text = inputModel?.description
        engineTypeLabel.text = inputModel?.engineType
    }
    
    func configure(with model: Car?) {
        self.inputModel = model
    }
    
}



