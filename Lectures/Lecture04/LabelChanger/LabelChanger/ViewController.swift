//
//  ViewController.swift
//  LabelChanger
//
//  Created by Robert Stjacques Jr on 9/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // the label changer model used to determine which strings to display
    private let model = LCModel()
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    
    
    @IBAction func firstButtonClicked(sender: AnyObject) {
        // this label uses absolute positioning and size.  it 
        // will not be centered on most screens, and it will
        // not resize for content, so the content is sometimes
        // cut off.
        firstLabel.text = model.getFirstLabel()
    }
    
    @IBAction func secondButtonClicked(sender: AnyObject) {
        // this label uses autolayout positioning so that it will
        // remain centered on the screen and its size will adjust
        // to fit the content as it changes
        secondLabel.text = model.getSecondLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // init both labels to starting strings
        firstLabel.text = model.getFirstLabel()
        secondLabel.text = model.getSecondLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

