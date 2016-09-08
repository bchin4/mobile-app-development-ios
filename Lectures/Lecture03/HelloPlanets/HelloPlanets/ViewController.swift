//
//  ViewController.swift
//  HelloPlanets
//
//  Created by Robert Stjacques Jr on 7/25/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let model = Planets()
    
    @IBOutlet var planetLabel: UILabel!

    @IBAction func changePlanet(sender: AnyObject) {
        planetLabel.text = model.getNextPlanet()
    }
    
    @IBAction func sayHello(sender: AnyObject) {
        planetLabel.text = model.hello()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetLabel.text = model.getNextPlanet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

