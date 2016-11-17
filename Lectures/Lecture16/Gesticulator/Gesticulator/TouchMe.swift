//
//  TouchMe.swift
//  Gesticulator
//
//  Created by Robert Stjacques Jr on 11/16/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class TouchMe: UIView, UIGestureRecognizerDelegate {
    var gestureListeners = [GestureListener]()
    
    var mostRecentLocation: CGPoint?
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(TouchMe.tripleTap(_:)))
        tripleTap.numberOfTapsRequired = 3
        addGestureRecognizer(tripleTap)
        
        // double tap gesture recognizer
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(TouchMe.doubleTap(_:)))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTap)
        
        // tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(TouchMe.tap(_:)))
        tap.require(toFail: doubleTap)
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
        
        // long press recognizer
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(TouchMe.longPress(_:)))
        addGestureRecognizer(longPress)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(TouchMe.pan(_:)))
        pan.delegate = self
        addGestureRecognizer(pan)
    }
    
    
    func notifyGestureListeners(gesture: Gesture) {
        for listener in gestureListeners {
            listener.gestureDidHappen(gesture)
        }
    }
    
    func notifyGestureListeners(type: String, recognizer: UIGestureRecognizer) {
        let location = recognizer.location(in: self)
        let previous = getPreviousLocation(location)
        mostRecentLocation = location
        let gesture = Gesture(type: type, location: location, previousLocation: previous, state: recognizer.state)
        notifyGestureListeners(gesture: gesture)
    }
    
    func getPreviousLocation(_ currentLocation: CGPoint) -> CGPoint {
        let previous: CGPoint
        if let prev = mostRecentLocation {
            previous = prev
        }
        else {
            previous = currentLocation
        }
        return previous
    }
    
    // MARK: gesture actions
    func tap(_ recognizer: UIGestureRecognizer) {
        print("tapped!")
        notifyGestureListeners(type: "Tap", recognizer: recognizer)
        
        let location = recognizer.location(in: self)
        
        let menu = UIMenuController.shared
        
        becomeFirstResponder()
        
        let redItem = UIMenuItem(title: "Red",
                                 action: #selector(TouchMe.setBackgroundColorToRed(_:)))
        let greenItem = UIMenuItem(title: "Green",
                                   action: #selector(TouchMe.setBackgroundColorToGreen(_:)))
        let blueItem = UIMenuItem(title: "Blue",
                                  action: #selector(TouchMe.setBackgroundColorToBlue(_:)))
        let grayItem = UIMenuItem(title: "Gray",
                                  action: #selector(TouchMe.setBackgroundColorToGray(_:)))
        menu.menuItems = [redItem, greenItem, blueItem, grayItem]
        menu.setTargetRect(CGRect(x: location.x, y: location.y, width: 2, height: 2), in: self)
        menu.setMenuVisible(true, animated: true)
    }
    
    func doubleTap(_ recognizer: UIGestureRecognizer) {
        print("double tapped!")
        notifyGestureListeners(type: "Double Tap", recognizer: recognizer)
    }
    
    func longPress(_ recognizer: UIGestureRecognizer) {
        print("long press")
        notifyGestureListeners(type: "Long Press", recognizer: recognizer)
    }
    
    func pan(_ recognizer: UIPanGestureRecognizer) {
        print("pan")
        notifyGestureListeners(type: "Pan", recognizer: recognizer)
    }
    
    func tripleTap(_ recognizer: UIPanGestureRecognizer) {
        print("triple tap!")
        notifyGestureListeners(type: "Triple Tap!", recognizer: recognizer)
    }
    
    // MARK: gesture recognizer delegate methods
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // MARK: menu handlers
    
    func setBackgroundColorToRed(_ sender: AnyObject) {
        backgroundColor = UIColor.red
    }
    
    func setBackgroundColorToGreen(_ sender: AnyObject) {
        backgroundColor = UIColor.green
    }
    
    func setBackgroundColorToBlue(_ sender: AnyObject) {
        backgroundColor = UIColor.blue
    }
    
    func setBackgroundColorToGray(_ sender: AnyObject) {
        backgroundColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }
    
}
