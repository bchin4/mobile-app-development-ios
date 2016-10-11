//
//  ViewController.swift
//  MakeItHappen
//
//  Created by Robert Stjacques Jr on 10/10/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topRight: UILabel!
    @IBOutlet var topLeft: UILabel!
    @IBOutlet var bottomRight: UILabel!
    @IBOutlet var bottomLeft: UILabel!
    
    @IBOutlet var topLeftY: NSLayoutConstraint!
    @IBOutlet var bottomRightX: NSLayoutConstraint!
    @IBOutlet var bottomRightY: NSLayoutConstraint!
    @IBOutlet var makeItHappenX: NSLayoutConstraint!
    @IBOutlet var makeItHappenY: NSLayoutConstraint!
    
    var animationCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func makeItHappen(_ sender: UIButton) {
        animateBackground()
        animateTopLeftBegin()
        animateTopRightBegin()
        animateBottomRightBegin()
        animateBottomLeftBegin()
        animateMakeItHappenBegin()
        
        // assign a variable to a closure
        let clickCounter = { (number: Int) -> Void in
            print("times clicked: " + number.description)
        }
        
        //then call it
        clickCounter(animationCount)
    }
    
    func animateBackground() {
        UIView.animate(
            withDuration: 2,
            animations: { () -> Void in
            self.view.backgroundColor = self.randomColor(alpha: 0.5)
        })
    }
    
    // slowly drops the label off of the bottom 
    //   of the screen
    func animateTopLeftBegin() {
        let height = view.frame.height
        self.topLeftY.constant += height
        
        let topLeftClosure = { () -> Void in
            self.topLeft.text = "Here I go!"
            self.view.layoutIfNeeded()
        }
        
        
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: [.curveLinear],
            animations: topLeftClosure,
            completion: { (Bool) -> Void in
                self.animateTopLeftEnd()
        })
    }
    
    // slowly raises the label back to its starting position
    func animateTopLeftEnd() {
        let height = view.frame.height
        self.topLeftY.constant -= height
        UIView.animate(
            withDuration: 2,
            animations: { _ in
                self.topLeft.text = "I'm back!"
                self.view.layoutIfNeeded()
            })
    }
    
    // slowly fades the top right label out
    func animateTopRightBegin() {
        
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.topRight.alpha = 0
                
            },
            completion: { (Bool) -> Void in
                self.animateTopRightEnd()
            })
    }
    
    // slowly fades the top right label back in
    func animateTopRightEnd() {
        UIView.animate(
            withDuration: 2.0,
            animations: { () -> Void in
                self.topRight.alpha = 1
        })
    }
    
    func animateBottomRightBegin() {
        let height = view.frame.height
        let width = view.frame.width
        
        bottomRightX.constant -= width
        bottomRightY.constant -= height
        
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.view.layoutIfNeeded()
            },
            completion: { (Bool) -> Void in
                UIView.animate(
                    withDuration: 2,
                    animations: { () -> Void in
                        self.bottomRightX.constant += width
                        self.bottomRightY.constant += height
                        self.view.layoutIfNeeded()
                        
                })
        })
    }
    
    func animateBottomLeftBegin() {
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: { () -> Void in
                // hack to get the background animate to work with a label
                self.bottomLeft.layer.backgroundColor = self.randomColor(alpha: 1.0).cgColor
            },
            completion: nil)
    }
    
    func animateMakeItHappenBegin() {
        animationCount += 1
        let constraint: NSLayoutConstraint
        let adjustment: CGFloat
        
        if animationCount % 2 == 0 {
            adjustment = view.frame.width
            constraint = makeItHappenX
        }
        else {
            adjustment = view.frame.height
            constraint = makeItHappenY
        }
        
        constraint.constant += adjustment
        
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.view.layoutIfNeeded()
            },
            completion: { (Bool) -> Void in
                constraint.constant -= (2 * adjustment)
                self.view.layoutIfNeeded()
                constraint.constant += adjustment
                UIView.animate(
                    withDuration: 2,
                    animations: { () -> Void in
                        self.view.layoutIfNeeded()
                })
        })
    }
    
    func randomFloat() -> Float {
        return Float(arc4random()) / Float(UINT32_MAX)
    }
    
    func randomColor(alpha: Float) -> UIColor {
        return UIColor(colorLiteralRed: randomFloat(),
                       green: randomFloat(),
                       blue: randomFloat(),
                       alpha: alpha) // always opaque
    }
}

