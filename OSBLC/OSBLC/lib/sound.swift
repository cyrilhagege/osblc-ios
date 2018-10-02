//
//  sound.swift
//  OSBLC
//
//  Created by HAGEGE Cyril on 02/10/2018.
//  Copyright © 2018 HAGEGE Cyril. All rights reserved.
//

import Foundation

import AVFoundation

var player: AVAudioPlayer?

func initPlayer() {
    guard let url = Bundle.main.url(forResource: "osblc", withExtension: "mp3") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setActive(true)
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        player?.prepareToPlay()
        player?.numberOfLoops = 200
    } catch let error {
        print(error.localizedDescription)
    }
}

func playSound() {
    if (player != nil) {
        player!.play()
    }
}

func pauseSound() {
    if (player != nil) {
        player!.pause()
    }
}

func getPlayer() -> AVAudioPlayer? {
    return player
}
