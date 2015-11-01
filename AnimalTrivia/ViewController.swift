//
//  ViewController.swift
//  AnimalTrivia
//
//  Created by Cornellana on 28/10/15.
//  Copyright © 2015 Cornellana. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit


class ViewController: UIViewController {
    

    var timer = NSTimer()
    var queButton = " "
    let segundos = 1.0
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    @IBOutlet weak var incorrectAImageView: UIImageView!
    @IBOutlet weak var incorrectBImageView: UIImageView!
    @IBOutlet weak var correctCImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func aButtonPressed(sender: AnyObject) {
        

        playSound("typewriter-key-1")
        
        
        incorrectAImageView.hidden = false
        aLabel.textColor = UIColor.redColor()
        bButton.enabled = false
        cButton.enabled = false
        queButton = "A"
        timer = NSTimer.scheduledTimerWithTimeInterval(segundos, target: self,selector: "update", userInfo: nil, repeats: false)
    }
    @IBAction func bButtonPressed(sender: AnyObject) {
        
 
        incorrectBImageView.hidden = false
        aButton.enabled = false
        cButton.enabled = false
        bLabel.textColor = UIColor.redColor()
        queButton = "B"
        timer = NSTimer.scheduledTimerWithTimeInterval(segundos, target: self,selector: "update", userInfo: nil, repeats: false)

    }
    @IBAction func cButtonPressed(sender: AnyObject) {
        correctCImageView.hidden = false
        bButton.enabled = false
        aButton.enabled = false
        cLabel.textColor = UIColor.greenColor()
        queButton = "C"
        timer = NSTimer.scheduledTimerWithTimeInterval(segundos, target: self,selector: "update", userInfo: nil, repeats: false)    }

    func update() {
        switch queButton {
        case "A":
                    incorrectAImageView.hidden = true
                    bButton.enabled = true
                    cButton.enabled = true
                    aLabel.textColor = UIColor.blackColor()
            
            case "B":
                    incorrectBImageView.hidden = true
                    aButton.enabled = true
                    cButton.enabled = true
                    bLabel.textColor = UIColor.blackColor()
            
            case "C":
                    correctCImageView.hidden = true
                    bButton.enabled = true
                    aButton.enabled = true
                    cLabel.textColor = UIColor.blackColor()
            
            default:()
        }
    }
    
    func playSound(soundName: String)
    {
        //let origen = (NSBundle.mainBundle().resourcePath! as NSString).stringByAppendingPathComponent(soundName + ".mp3")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let origin = dirPaths[0] + "/" + soundName + ".mp3"
        let coinSound = NSURL(fileURLWithPath: origin)
        
        //let coinSound = NSURL(fileURLWithPath: NSBundle.mainBundle().resourcePath(soundName, ofType: "mp3")!)
        do{
            let audioPlayer = try AVAudioPlayer(contentsOfURL:coinSound)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }catch {
            print("Error getting the audio file")
        }
    }

}

