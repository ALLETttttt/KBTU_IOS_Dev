//
//  MusicViewController.swift
//  TabBarAndNavigation
//
//  Created by Бакдаулет on 15.11.2024.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet private weak var tableViewMusic: UITableView!
    
    let data: [Music] = [
        Music(
            title: "Blinding Lights",
            imageName: UIImage(named: "m1")!,
            artist: "The Weeknd",
            album: "After Hours",
            description: "A captivating synth-pop track that combines nostalgia with modern production."
        ),
        Music(
            title: "Bohemian Rhapsody",
            imageName: UIImage(named: "m2")!,
            artist: "Queen",
            album: "A Night at the Opera",
            description: "A groundbreaking rock opera blending ballad, opera, and hard rock elements."
        ),
        Music(
            title: "Shape of You",
            imageName: UIImage(named: "m3")!,
            artist: "Ed Sheeran",
            album: "Divide",
            description: "A catchy pop track with tropical house beats and romantic lyrics."
        ),
        Music(
            title: "Smells Like Teen Spirit",
            imageName: UIImage(named: "m4")!,
            artist: "Nirvana",
            album: "Nevermind",
            description: "An iconic grunge anthem that defined the spirit of the 90s alternative rock era."
        ),
        Music(
            title: "Rolling in the Deep",
            imageName: UIImage(named: "m5")!,
            artist: "Adele",
            album: "21",
            description: "A powerful soul track that showcases Adele's impressive vocal range and depth."
        )
    ]
    
    private var selectedMusic: Music?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMusic.dataSource = self
        tableViewMusic.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destDVC = segue.destination as? DetailViewController else {
            return
        }
        destDVC.configureMusic(with: selectedMusic)
    }
    
}

extension MusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMusic = data[indexPath.row]
        performSegue(withIdentifier: "musicSegue", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let musics = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicTableViewCell
        cell.imageLabel.image = musics.imageName
        cell.titleLabel.text = musics.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

