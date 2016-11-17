//
//  ViewController.swift
//  Gesticulator
//
//  Created by Robert Stjacques Jr on 11/16/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GestureListener {
    @IBOutlet var gestureType: UILabel!
    @IBOutlet var gestureLocationX: UILabel!
    @IBOutlet var gestureLocationY: UILabel!
    @IBOutlet var gestureRelativePositionHorizontal: UILabel!
    @IBOutlet var gestureRelativePositionVertical: UILabel!
    @IBOutlet var gestureState: UILabel!
    @IBOutlet var touchMe: TouchMe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        touchMe.gestureListeners.append(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func gestureDidHappen(_ gesture: Gesture) {
        gestureType.text = gesture.type
        gestureLocationX.text =
            Int(gesture.location.x).description
        gestureLocationY.text =
            Int(gesture.location.y).description
        gestureRelativePositionHorizontal.text =
            gesture.relativeHorizontalPosition
        gestureRelativePositionVertical.text =
            gesture.relativeVerticalPosition
        gestureState.text = gesture.stateString
    }
}

