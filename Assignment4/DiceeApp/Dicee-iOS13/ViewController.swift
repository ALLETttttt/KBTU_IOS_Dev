//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    // Array of dice images
       let diceImages = [UIImage(named: "DiceOne"),
                         UIImage(named: "DiceTwo"),
                         UIImage(named: "DiceThree"),
                         UIImage(named: "DiceFour"),
                         UIImage(named: "DiceFive"),
                         UIImage(named: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func roleDiceButton(_ sender: UIButton) {
        rollDice()
    }
    
    // Function to roll the dice
        func rollDice() {
            var randomIndex1 = Int.random(in: 0...5)
            var randomIndex2 = Int.random(in: 0...5)
            
            // Ensure that the two dice images are not the same
            while randomIndex1 == randomIndex2 {
                randomIndex2 = Int.random(in: 0...5)
            }

            diceImageView1.image = diceImages[randomIndex1]
            diceImageView2.image = diceImages[randomIndex2]
        }

        // Bonus Challenge: Detect shake gesture to roll the dice
        override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                rollDice()
            }
        }
    
    
}

