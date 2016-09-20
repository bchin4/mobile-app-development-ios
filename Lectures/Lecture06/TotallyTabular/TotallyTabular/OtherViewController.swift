//
//  OtherViewController.swift .swift
//  TotallyTabular
//
//  Created by Robert Stjacques Jr on 9/19/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    override func loadView() {
        super.loadView()
        print("OtherViewController loadView() called")
        
        view.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("OtherViewController viewDidLoad() called")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("OtherViewController viewWillAppear() called")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("OtherViewController viewDidAppear() called")
    }
    
    @IBAction func screenTapped() {
        view.backgroundColor = randomColor()
    }
    
    func randomColor() -> UIColor {
        return UIColor(colorLiteralRed: randomFloat(),
                       green: randomFloat(),
                       blue: randomFloat(),
                       alpha: 1.0) // always opaque
    }
    
    func randomFloat() -> Float {
        return Float(arc4random()) / Float(UINT32_MAX)
    }
}
