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
    let segundos = 3.0
    var ding:AVAudioPlayer = AVAudioPlayer()
    

    
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
        queButton = "A"
        timer = NSTimer.scheduledTimerWithTimeInterval(segundos, target: self,selector: "update", userInfo: nil, repeats: false)
    }
    @IBAction func bButtonPressed(sender: AnyObject) {
        
 
        incorrectBImageView.hidden = false
        queButton = "B"
        timer = NSTimer.scheduledTimerWithTimeInterval(segundos, target: self,selector: "update", userInfo: nil, repeats: false)

    }
    @IBAction func cButtonPressed(sender: AnyObject) {
        correctCImageView.hidden = false
        queButton = "C"
        timer = NSTimer.scheduledTimerWithTimeInterval(segundos, target: self,selector: "update", userInfo: nil, repeats: false)    }

    func update() {
        switch queButton {
            case "A":incorrectAImageView.hidden = true
            case "B":incorrectBImageView.hidden = true
            case "C":correctCImageView.hidden = true
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

