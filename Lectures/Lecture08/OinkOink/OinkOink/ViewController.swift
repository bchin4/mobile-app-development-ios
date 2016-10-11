//
//  ViewController.swift
//  OinkOink
//
//  Created by Robert Stjacques Jr on 10/5/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topLeftLabel: UILabel!
    @IBOutlet var topRightLabel: UILabel!
    @IBOutlet var bottomCenterLabel: UILabel!
    
    @IBAction func makeThingsHappen(_ sender: UIButton) {
        print("clicked!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let topLeftText = "Well, not quite top left."
        let topLeftText = NSLocalizedString("Top Left", comment: "The text for the label displayed near the top left")
        topLeftLabel.text = topLeftText
        
        let bottomCenterText = NSLocalizedString("Bottom Center", comment: "The text for the bottom center label")
        bottomCenterLabel.text = bottomCenterText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

