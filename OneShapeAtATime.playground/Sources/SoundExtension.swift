import Foundation
import UIKit
import AVFoundation

var sfxPlayer: AVAudioPlayer?
var bgmPlayer: AVAudioPlayer?

extension UIView {
    func playSfx(fileName: String, fileExtension: String) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: fileExtension)!)

        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: url)
            sfxPlayer?.play()
        } catch {
            print("Failed to load sfx")
        }
    }
    
    func playBgm(fileName: String, fileExtension: String) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: fileExtension)!)

        do {
            bgmPlayer = try AVAudioPlayer(contentsOf: url)
            bgmPlayer?.numberOfLoops = -1
            bgmPlayer?.volume = 0.8
            bgmPlayer?.play()
        } catch {
            print("Failed to load bgm")
        }
    }
    
    func playPlaygroundBgm() {
        playBgm(fileName: "bgm-thelounge", fileExtension: "mp3")
    }
    
    func playButtonSfx() {
        playSfx(fileName: "sfx-click", fileExtension: "mp3")
    }
    
    func playCompleteSfx() {
        playSfx(fileName: "sfx-complete", fileExtension: "mp3")
    }
}
