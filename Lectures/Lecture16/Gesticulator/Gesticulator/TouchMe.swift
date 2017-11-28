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
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(TouchMe.pinch(_:)))
        pinch.delegate = self
        addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(TouchMe.rotate(_:)))
        rotate.delegate = self
        addGestureRecognizer(rotate)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(TouchMe.swipe(_:)))
        swipe.delegate = self
        addGestureRecognizer(swipe)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(TouchMe.pan(_:)))
        pan.delegate = self
        tap.require(toFail: rotate)
        tap.require(toFail: swipe) // doesn't seem to work
        addGestureRecognizer(pan)
    }
    
    func notifyGestureListeners(gesture: Gesture) {
        // hack to get the menu to go away if it's still open
        UIMenuController.shared.setMenuVisible(false, animated: true)
        // notify listeners that the gesture happened!
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
    @objc func tap(_ recognizer: UIGestureRecognizer) {
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
    
    @objc func doubleTap(_ recognizer: UIGestureRecognizer) {
        print("double tapped!")
        notifyGestureListeners(type: "Double Tap", recognizer: recognizer)
    }
    
    @objc func longPress(_ recognizer: UIGestureRecognizer) {
        print("long press")
        notifyGestureListeners(type: "Long Press", recognizer: recognizer)
    }
    
    @objc func pan(_ recognizer: UIPanGestureRecognizer) {
        print("pan")
        notifyGestureListeners(type: "Pan", recognizer: recognizer)
    }
    
    @objc func tripleTap(_ recognizer: UIPanGestureRecognizer) {
        print("triple tap!")
        notifyGestureListeners(type: "Triple Tap!", recognizer: recognizer)
    }
    
    @objc func rotate(_ recognizer: UIRotationGestureRecognizer) {
        print("rotate")
        notifyGestureListeners(type: "Rotate", recognizer: recognizer)
    }
    
    @objc func pinch(_ recognizer: UIPinchGestureRecognizer) {
        print("pinch")
        notifyGestureListeners(type: "Pinch", recognizer: recognizer)
    }
    
    // can't seem to get both swipe and pan to work...is there a difference?
    @objc func swipe(_ recognizer: UISwipeGestureRecognizer) {
        print("swipe")
        notifyGestureListeners(type: "Swipe", recognizer: recognizer)
    }
    
    // MARK: gesture recognizer delegate methods
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // MARK: menu handlers
    
    @objc func setBackgroundColorToRed(_ sender: AnyObject) {
        backgroundColor = UIColor.red
    }
    
    @objc func setBackgroundColorToGreen(_ sender: AnyObject) {
        backgroundColor = UIColor.green
    }
    
    @objc func setBackgroundColorToBlue(_ sender: AnyObject) {
        backgroundColor = UIColor.blue
    }
    
    @objc func setBackgroundColorToGray(_ sender: AnyObject) {
        backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }
}
