//
//  ViewController.swift
//  TotallyTabular
//
//  Created by Robert Stjacques Jr on 9/19/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad() called")
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController viewWillAppear() called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController viewDidAppear() called")
    }

    override func loadView() {
        super.loadView()
        print("ViewController loadView() called")
    }
}

