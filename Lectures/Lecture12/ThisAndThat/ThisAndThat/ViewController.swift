//
//  ViewController.swift
//  ThisAndThat
//
//  Created by Robert Stjacques Jr on 11/1/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var thingButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    
    var count: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = count.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // make sure it's the right seque (there may be
        // more than one)
        if segue.identifier == "EditButton" {
            // cast the next view controller into a 
            // button changer
            let buttonChanger = segue.destination as! ButtonChangerViewController
            // set its button property
            buttonChanger.theButton = thingButton
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        count = count + 1
        countLabel.text = count.description
        
        print("main view controller is appearing")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("main view controller is disappearing")
    }
}

