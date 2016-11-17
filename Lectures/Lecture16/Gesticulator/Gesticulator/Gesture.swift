//
//  Gesture.swift
//  Gesticulator
//
//  Created by Robert Stjacques Jr on 11/16/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Gesture {
    // the gesture type (tap, double tap, pan, etc.)
    var type: String
    // the location of the gesture
    var location: CGPoint
    // the location of the previous gesture
    var previousLocation: CGPoint
    // the state (discrete, possible, changed, etc.).
    var state: UIGestureRecognizerState
    
    var relativeHorizontalPosition: String {
        get {
            let relativeHorizontalPosition: String
            let difference = location.x - previousLocation.x
            if difference < 0 {
                relativeHorizontalPosition = "To the Left"
            }
            else if difference > 0 {
                relativeHorizontalPosition = "To the Right"
            }
            else {
                relativeHorizontalPosition = "The Same"
            }
            return relativeHorizontalPosition
        }
    }
    
    var relativeVerticalPosition: String {
        get {
            let relativeVerticalPosition: String
            let difference = location.y - previousLocation.y
            if difference < 0 {
                relativeVerticalPosition = "Above"
            }
            else if difference > 0 {
                relativeVerticalPosition = "Below"
            }
            else {
                relativeVerticalPosition = "The Same"
            }
            return relativeVerticalPosition
        }
    }
    
    var stateString: String {
        switch(state) {
        case .began:
            return "Began"
        case .cancelled:
            return "Cancelled"
        case .changed:
            return "Changed"
        case .ended:
            return "Ended"
        case .failed:
            return "Failed?"
        case .possible:
            return "Possible!"
        }
    }
    
    init(type: String, location: CGPoint, previousLocation: CGPoint, state: UIGestureRecognizerState) {
        self.type = type
        self.location = location
        self.previousLocation = previousLocation
        self.state = state
    }
}
