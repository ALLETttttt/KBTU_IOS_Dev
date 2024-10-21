//
//  ViewController.swift
//  EggTimer
//
//  Created by Бакдаулет on 21.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // UI Elements
    var softBoiledEggImageView: UIImageView!
    var mediumBoiledEggImageView: UIImageView!
    var hardBoiledEggImageView: UIImageView!
    var progressBar: UIProgressView!
    var timerLabel: UILabel!
    
    // Timer variables
    var timer: Timer?
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    
    // Egg times in seconds
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()  // Method to set up the interface
        setupAutoLayout() // Apply AutoLayout to UI elements
    }
    
    // Method to set up the User Interface
    func setupUI() {
        // Create UIImageViews for each egg
        softBoiledEggImageView = UIImageView(image: UIImage(named: "softBoiledEgg"))
        mediumBoiledEggImageView = UIImageView(image: UIImage(named: "mediumBoiledEgg"))
        hardBoiledEggImageView = UIImageView(image: UIImage(named: "hardBoiledEgg"))
        
        // Enable user interaction for the images
        softBoiledEggImageView.isUserInteractionEnabled = true
        mediumBoiledEggImageView.isUserInteractionEnabled = true
        hardBoiledEggImageView.isUserInteractionEnabled = true
        
        // Add tap gestures to each egg image
        let softTap = UITapGestureRecognizer(target: self, action: #selector(eggTapped(_:)))
        let mediumTap = UITapGestureRecognizer(target: self, action: #selector(eggTapped(_:)))
        let hardTap = UITapGestureRecognizer(target: self, action: #selector(eggTapped(_:)))
        
        softBoiledEggImageView.addGestureRecognizer(softTap)
        mediumBoiledEggImageView.addGestureRecognizer(mediumTap)
        hardBoiledEggImageView.addGestureRecognizer(hardTap)
        
        // Add UIProgressView for the progress bar
        progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.progress = 0.0
        
        // Timer label to show remaining time
        timerLabel = UILabel()
        timerLabel.text = "00:00"
        timerLabel.font = UIFont.systemFont(ofSize: 24)
        timerLabel.textAlignment = .center
        
        // Add elements as subviews
        view.addSubview(softBoiledEggImageView)
        view.addSubview(mediumBoiledEggImageView)
        view.addSubview(hardBoiledEggImageView)
        view.addSubview(progressBar)
        view.addSubview(timerLabel)
    }
    
    // Apply AutoLayout constraints to the UI elements
    func setupAutoLayout() {
        // Disable autoresizing masks
        softBoiledEggImageView.translatesAutoresizingMaskIntoConstraints = false
        mediumBoiledEggImageView.translatesAutoresizingMaskIntoConstraints = false
        hardBoiledEggImageView.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Example constraints for softBoiledEggImageView
        NSLayoutConstraint.activate([
            softBoiledEggImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            softBoiledEggImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            softBoiledEggImageView.widthAnchor.constraint(equalToConstant: 100),
            softBoiledEggImageView.heightAnchor.constraint(equalToConstant: 100),
            
            mediumBoiledEggImageView.topAnchor.constraint(equalTo: softBoiledEggImageView.topAnchor),
            mediumBoiledEggImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mediumBoiledEggImageView.widthAnchor.constraint(equalToConstant: 100),
            mediumBoiledEggImageView.heightAnchor.constraint(equalToConstant: 100),
            
            hardBoiledEggImageView.topAnchor.constraint(equalTo: softBoiledEggImageView.topAnchor),
            hardBoiledEggImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hardBoiledEggImageView.widthAnchor.constraint(equalToConstant: 100),
            hardBoiledEggImageView.heightAnchor.constraint(equalToConstant: 100),
            
            progressBar.topAnchor.constraint(equalTo: softBoiledEggImageView.bottomAnchor, constant: 50),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            timerLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // Method to handle egg selection
    @objc func eggTapped(_ sender: UITapGestureRecognizer) {
        // Reset any previous timer
        timer?.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        // Identify which egg was tapped
        if sender.view == softBoiledEggImageView {
            startTimer(for: "Soft")
        } else if sender.view == mediumBoiledEggImageView {
            startTimer(for: "Medium")
        } else if sender.view == hardBoiledEggImageView {
            startTimer(for: "Hard")
        }
    }
    
    // Method to start the timer for the selected egg
    func startTimer(for eggType: String) {
        totalTime = eggTimes[eggType]!
        progressBar.progress = 0.0
        timerLabel.text = timeString(time: TimeInterval(totalTime))
        
        // Create a new timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Method to update the timer and progress bar
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progressFraction = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = progressFraction
            timerLabel.text = timeString(time: TimeInterval(totalTime - secondsPassed))
        } else {
            timer?.invalidate()
            timerLabel.text = "DONE!"
            playAlarm()
        }
    }
    
    // Method to format the time as a string
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    // Method to play an alarm sound when the timer is finished
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    
}

