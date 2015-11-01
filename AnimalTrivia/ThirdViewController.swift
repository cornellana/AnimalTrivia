//
//  ThirdViewController.swift
//  AnimalTrivia
//
//  Created by Cornellana on 1/11/15.
//  Copyright © 2015 Cornellana. All rights reserved.
//

import UIKit

let colorRojo = UIColor.redColor()
let colorVerde = UIColor.greenColor()

class ThirdViewController: UIViewController {

    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    
    @IBOutlet weak var startOverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startOverButton.layer.cornerRadius = 7
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func aButtonPressed(sender: UIButton) {
        
        aButton.setImage(UIImage(named: "incorrectAnswer"), forState: UIControlState.Normal)
        bButton.enabled = false
        cButton.enabled = false
        aLabel.textColor = colorRojo
        
    }
    
    @IBAction func bButtonPressed(sender: UIButton) {
        
        bButton.setImage(UIImage(named: "incorrectAnswer"), forState: UIControlState.Normal)
        aButton.enabled = false
        cButton.enabled = false
        bLabel.textColor = colorRojo
        
    }
    
    
    @IBAction func cButtonPressed(sender: UIButton) {
        
        cButton.setImage(UIImage(named: "correctAnswer"), forState: UIControlState.Normal)
        bButton.enabled = false
        aButton.enabled = false
        cLabel.textColor = colorVerde
    }
    
    

}
