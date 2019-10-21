//
//  ViewController.swift
//  play-audio-snippet
//
//  Created by Declan on 03/07/2019.
//  Copyright © 2019 Declan Conway. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Initialize instance of AVAudioPlayer
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = initializePlayer()
  
    }
    
    private func initializePlayer() -> AVAudioPlayer? {
        guard let path = Bundle.main.path(forResource: "sample", ofType: "mp3") else {
            return nil
        }

        return try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
    }

    
    @IBAction func playTapped(_ sender: Any) {
       
        audioPlayer?.play()
        
    }
    
    
    @IBAction func pauseTapped(_ sender: Any) {
        
        if audioPlayer!.isPlaying {

            audioPlayer?.pause()
        }
        
    }
    
   
    @IBAction func restartTapped(_ sender: Any) {
    
        //Set the position within the song to the start
        audioPlayer?.currentTime = 0
        
        audioPlayer?.play()
    
    }
    
}

