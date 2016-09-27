//
//  ViewController.swift
//  YetAnotherAmazingApp
//
//  Created by Robert Stjacques Jr on 9/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Colors()
    var mainView: UIView!
    
    override func loadView() {
        mainView = UIView()
        view = mainView
        
        mainView.backgroundColor = model.getColor()
        let margins = mainView.layoutMarginsGuide

        // first bar
        let first = getColorBar()
        first.addTarget(self,
                            action: "toggleFirstChannel:",
                            forControlEvents: .ValueChanged)
        mainView.addSubview(first)
        
        let firstTopConstraint = first.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 24)
        let firstLeadingConstraint = first.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let firstTrailingConstraint = first.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        firstTopConstraint.active = true
        firstLeadingConstraint.active = true
        firstTrailingConstraint.active = true
        
        // second bar
        let second = getColorBar()
        second.addTarget(self,
                        action: "toggleSecondChannel:",
                        forControlEvents: .ValueChanged)
        mainView.addSubview(second)
        
        let secondHorizontalConstraint = second.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor)
        let secondVerticalConstraint = second.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor)
        
        secondHorizontalConstraint.active = true
        secondVerticalConstraint.active = true
        
        // third bar
        let third = getColorBar()
        third.addTarget(self,
                        action: "toggleThirdChannel:",
                        forControlEvents: .ValueChanged)
        mainView.addSubview(third)
        
        let thirdTopConstraint = third.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -24)
        let thirdLeadingConstraint = third.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let thirdTrailingConstraint = third.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        thirdTopConstraint.active = true
        thirdLeadingConstraint.active = true
        thirdTrailingConstraint.active = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleFirstChannel(buttonBar: UISegmentedControl) {
        let index = buttonBar.selectedSegmentIndex
        model.toggleFirstChannel(R: index == 0, G: index == 1, B: index == 2)
        mainView.backgroundColor = model.getColor()
    }
    
    func toggleSecondChannel(buttonBar: UISegmentedControl) {
        let index = buttonBar.selectedSegmentIndex
        model.toggleSecondChannel(R: index == 0, G: index == 1, B: index == 2)
        mainView.backgroundColor = model.getColor()
    }
    
    func toggleThirdChannel(buttonBar: UISegmentedControl) {
        let index = buttonBar.selectedSegmentIndex
        model.toggleThirdChannel(R: index == 0, G: index == 1, B: index == 2)
        mainView.backgroundColor = model.getColor()
    }
    
    func getColorBar() -> UISegmentedControl {
        let buttonBar = UISegmentedControl(items: ["Red", "Green", "Blue", "None"])
        
        buttonBar.backgroundColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 1.0, alpha: 1.0)
        
        buttonBar.selectedSegmentIndex = 3
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        
        return buttonBar
    }
}

