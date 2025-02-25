//
//  audioManagaer.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 03/02/25.
//

import AVFoundation

import AVFoundation

class AudioManager: ObservableObject {
    @MainActor static let shared = AudioManager()
    var backgroundMusicPlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?

    private init() {}

    // Play Background Music
    func playBackgroundMusic() {
        guard let path = Bundle.main.path(forResource: "media/backgroundMusic", ofType: "mp3") else {
            print("Background music file not found!")
            return
        }
        
        do {
            let url = URL(fileURLWithPath: path)
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.volume = 0.3
            backgroundMusicPlayer?.numberOfLoops = -1  // Infinite looping
            backgroundMusicPlayer?.play()

            // Enable background playback
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error loading background music: \(error.localizedDescription)")
        }
    }

    func stopMusic() {
        backgroundMusicPlayer?.stop()
    }

    // Play Sound Effects
    func playSoundEffect(named soundName: String) {
        guard let path = Bundle.main.path(forResource: "media/\(soundName)", ofType: "mp3") else {
            print("Sound effect \(soundName) not found!")
            return
        }

        do {
            let url = URL(fileURLWithPath: path)
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
            soundEffectPlayer?.volume = 0.3  // Full volume
            soundEffectPlayer?.play()
        
        } catch {
            print("Error playing sound effect \(soundName): \(error.localizedDescription)")
        }
    }
}
