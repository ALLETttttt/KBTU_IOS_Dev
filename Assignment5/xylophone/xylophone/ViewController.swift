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
        
        setupUI()
    }
    
    // Function to setup the UI with buttons for notes
    func setupUI() {
        let notes = ["C", "D", "E", "F", "G", "A", "B"]
        let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .cyan]
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0) // Margins for stackView
                
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        for (index, note) in notes.enumerated() {
            let button = UIButton()
            button.backgroundColor = colors[index]
            button.setTitle(note, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            button.tag = index
            button.addTarget(self, action: #selector(notePressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    // Function to play the sound when a button is tapped
    @objc func notePressed(sender: UIButton) {
        let notes = ["C", "D", "E", "F", "G", "A", "B"]
        let selectedNote = notes[sender.tag]
        
        playSound(note: selectedNote)
        
        // Adding a visual feedback animation
        UIView.animate(withDuration: 0.2, animations: {
            sender.alpha = 0.5
        }) { (finished) in
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 1.0
            }
        }
    }
    
    // Function to play the corresponding sound
    func playSound(note: String) {
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

