//
//  ViewController.swift
//  LetterStomper
//
//  Created by Robert Stjacques Jr on 9/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let DEFAULT_STRING = "Hi, there!"
    
    
    @IBOutlet var outputLabel: UILabel!
    
    
    @IBAction func messageReceived(textField: UITextField) {
        if let text = textField.text where !text.isEmpty {
            outputLabel.text = text
        }
        else {
            outputLabel.text = DEFAULT_STRING
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = DEFAULT_STRING
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

