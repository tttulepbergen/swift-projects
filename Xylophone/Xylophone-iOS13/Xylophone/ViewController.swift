//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    var audio: AVAudioPlayer!
    var soundArray = ["C", "D", "E", "F", "G", "A", "B"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSound = soundArray[(sender.tag) - 1]
        playingSound(chooseSound: selectedSound)
    }
    
    
    func playingSound(chooseSound: String) {
        guard let soundURL = Bundle.main.url(forResource: chooseSound, withExtension: "wav") else {
            print("Sound file not found")
            return
        }
        
        do {
            try audio = AVAudioPlayer(contentsOf: soundURL)
            audio.prepareToPlay()
            audio.play()
        } catch {
            print(error)
        }
    }
}
