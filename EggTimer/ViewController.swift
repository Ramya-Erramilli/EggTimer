//
//  ViewController.swift
//  EggTimer

import UIKit
import AVKit

class ViewController: UIViewController {
    

    let eggTimes = ["Soft":3, "Medium":4,"Hard":7]

    var secondsRemaining = 60
    var secondsPassed = 0
    var totalTime = 0
    var player = AVAudioPlayer()
    var timer = Timer()
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var progressBarOutlet: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
//        print(sender.currentTitle)
        
//        if hardness=="Soft"{
//            print(softTime)
//        }else if hardness=="Medium"{
//            print(mediumTime)
//        }else{
//            print(hardTime)
//        }
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        
        timer.invalidate()
        progressBarOutlet.progress = 0.0
        secondsPassed = 0
        labelOutlet.text = hardness!
        var time = eggTimes[hardness!]
        secondsRemaining = time!
        totalTime = time!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func updateTimer(){
        if secondsPassed<totalTime{

            secondsPassed += 1
//            secondsRemaining -= 1
            var percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBarOutlet.progress = Float(percentageProgress)
        }
        else{
            timer.invalidate()
            labelOutlet.text = "DONE!"
            playAlarm()

        }
    }
    
    func playAlarm(){
        do{
        var url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try AVAudioPlayer(contentsOf: url!)
        player.play()
        }
        catch let error{
            print("Error")
        }
        
    }
    
}
