//
//  ViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit
import AVFoundation


class HomeViewController: UIViewController {
    var backgroundMusicPlayer = AVAudioPlayer()

    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backgroundMusicURL:NSURL = Bundle.main.url(forResource: "song1", withExtension: "mp3")! as NSURL
        backgroundMusicPlayer = AVAudioPlayer(contentsOf: backgroundMusicURL, error: nil)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
        
    }//END VIEWDIDLOAD
    


}

