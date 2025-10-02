import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggCookingTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer: Timer?
    var player: AVAudioPlayer!
    
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    
    // Action for hardness selection
    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.currentTitle, let cookingTime = eggCookingTimes[hardness] else { return }
        
        resetTimer()
        
        totalTime = cookingTime
        titleLabel.text = hardness
        startTimer()
    }
    
    // Reset timer and progress
    private func resetTimer() {
        timer?.invalidate() // Invalidate existing timer
        secondsPassed = 0
        progressBar.progress = 0.0
    }
    
    // Start the timer
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Update the timer and progress bar
    @objc private func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            updateProgressBar()
        } else {
            finishCooking()
        }
    }
    
    // Update progress bar based on elapsed time
    private func updateProgressBar() {
        progressBar.progress = Float(secondsPassed) / Float(totalTime)
        print(progressBar.progress)
    }
    
    // Finish cooking and play alarm sound
    private func finishCooking() {
        timer?.invalidate()
        titleLabel.text = "Egg's ready!"
        playAlarmSound()
    }
    
    // Play the alarm sound
    private func playAlarmSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Error playing alarm sound: \(error)")
        }
    }
}



