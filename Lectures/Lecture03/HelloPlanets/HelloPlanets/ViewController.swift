//
//  ViewController.swift
//  HelloPlanets
//
//  Created by Robert Stjacques Jr on 7/25/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // the model used to control the state and core application logic
    private let model = Planets()
    
    // the label that is updated with the current planet/hello message
    // this needs to be set up as an outlet so that the controller can
    // modify the text displayed
    @IBOutlet var planetLabel: UILabel!

    // the first of two action methods that is wired to a button in
    // the user interface.  this one changes the name of the planet
    // displayed on the label using the outlet
    @IBAction func changePlanet(sender: AnyObject) {
        planetLabel.text = model.getNextPlanet()
    }
    
    // the second of two action methods that is wired to a button in
    // the user interface.  this one changes the message on the label
    // to say hello to the current planet.
    @IBAction func sayHello(sender: AnyObject) {
        planetLabel.text = model.hello()
    }
    
    // generated function with one change: the outlet is used to set
    // the label to display the first planet ("Earth") by default.
    override func viewDidLoad() {
        super.viewDidLoad()
        planetLabel.text = model.getNextPlanet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

