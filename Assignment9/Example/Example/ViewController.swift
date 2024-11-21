//
//  ViewController.swift
//  Example
//
//  Created by Бакдаулет on 15.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var labelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for:  indexPath) as! LabelTableViewCell
        cell.titleLabel.text = String(indexPath.row)
        return cell
    }
}

