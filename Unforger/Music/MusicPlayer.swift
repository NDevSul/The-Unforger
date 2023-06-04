//
//  MusicPlayer.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import AVFoundation

class MusicPlayer {
    var audioPlayer: AVAudioPlayer?

    init() {
        // Initialize the audio player and set up the music file
        guard let musicURL = Bundle.main.url(forResource: "lagudegdega", withExtension: "mp3") else {
            print("Failed to find the music file.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: musicURL)
            audioPlayer?.numberOfLoops = -1 // Set it to -1 for infinite looping
        } catch {
            print("Failed to initialize the audio player: \(error.localizedDescription)")
        }
    }

    func play() {
        audioPlayer?.play()
    }

    func stop() {
        audioPlayer?.stop()
    }
}
