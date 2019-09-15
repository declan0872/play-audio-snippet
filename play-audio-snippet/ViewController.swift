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
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
          
            audioPlayer = try AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "sample", withExtension: "mp3")!)
            audioPlayer.prepareToPlay()
            
            //Create an audio session to let the audio play in the background
            //You need to also enable this in Capabilities -> Background Modes -> Set to on ->
            //check the "Audio, Airplay and Picture in Picture" checkbox
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } 
            
        } catch {
           
            print(error)
        }
        
        
    }

    
    @IBAction func playTapped(_ sender: Any) {
       
        audioPlayer.play()
        
    }
    
    
    @IBAction func pauseTapped(_ sender: Any) {
        
        if audioPlayer.isPlaying {
           
            audioPlayer.pause()
        }
        
    }
    
   
    @IBAction func restartTapped(_ sender: Any) {
    
        //Set the position within the song to the start
        audioPlayer.currentTime = 0
        
        audioPlayer.play()
    
    }
    
}

