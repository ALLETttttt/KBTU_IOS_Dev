//
//  ViewController.swift
//  xylophone
//
//  Created by Бакдаулет on 20.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func noteA(_ sender: UIButton) {
        playSound(note: "A", sender: sender)
    }
    
    @IBAction func noteB(_ sender: UIButton) {
        playSound(note: "B", sender: sender)
    }
    @IBAction func noteC(_ sender: UIButton) {
        playSound(note: "C", sender: sender)
    }
    
    
    @IBAction func noteD(_ sender: UIButton) {
        playSound(note: "D", sender: sender)
    }
    
    @IBAction func noteE(_ sender: UIButton) {
        playSound(note: "E", sender: sender)
    }
    
    @IBAction func noteF(_ sender: UIButton) {
        playSound(note: "F", sender: sender)
    }
    
    @IBAction func noteG(_ sender: UIButton) {
        playSound(note: "G", sender: sender)
    }
    
    // Function to play the corresponding sound
    func playSound(note: String, sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
                    sender.alpha = 0.5
                }) { (finished) in
                    UIView.animate(withDuration: 0.2) {
                        sender.alpha = 1.0
                    }
                }
        if let soundURL = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
}

