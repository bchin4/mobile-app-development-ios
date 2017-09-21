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
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = model.getColor()
        let margins = view.layoutMarginsGuide

        // first bar
        let first = getColorBar()
        first.addTarget(self,
                            action: #selector(ViewController.toggleFirstChannel(_:)),
                            for: UIControlEvents.valueChanged)
        
        
        first.frame = CGRect(x: 200, y:200, width: 200, height: 50)
        print(first.frame)
        
        view.addSubview(first)
        
        let firstTopConstraint = first.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 24)
        let firstLeadingConstraint = first.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let firstTrailingConstraint = first.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        firstTopConstraint.isActive = true
        firstLeadingConstraint.isActive = true
        firstTrailingConstraint.isActive = true

        // second bar
        let second = getColorBar()
        second.addTarget(self,
                        action: #selector(ViewController.toggleSecondChannel(_:)),
                        for: .valueChanged)
        view.addSubview(second)
        
        let secondHorizontalConstraint = second.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        let secondVerticalConstraint = second.centerYAnchor.constraint(equalTo: margins.centerYAnchor)

        secondHorizontalConstraint.isActive = true
        secondVerticalConstraint.isActive = true
        
        // third bar
        let third = getColorBar()
        third.addTarget(self,
                        action: #selector(ViewController.toggleThirdChannel(_:)),
                        for: .valueChanged)
        view.addSubview(third)
        
        let thirdTopConstraint = third.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -24)
        let thirdLeadingConstraint = third.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let thirdTrailingConstraint = third.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        thirdTopConstraint.isActive = true
        thirdLeadingConstraint.isActive = true
        thirdTrailingConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleFirstChannel(_ buttonBar: UISegmentedControl) {
        let index = buttonBar.selectedSegmentIndex
        model.toggleFirstChannel(RED: index == 0,
                                 GREEN: index == 1,
                                 BLUE: index == 2)
        view.backgroundColor = model.getColor()
    }
    
    func toggleSecondChannel(_ buttonBar: UISegmentedControl) {
        let index = buttonBar.selectedSegmentIndex
        model.toggleSecondChannel(RED: index == 0,
                                  GREEN: index == 1,
                                  BLUE: index == 2)
        view.backgroundColor = model.getColor()
    }
    
    func toggleThirdChannel(_ buttonBar: UISegmentedControl) {
        let index = buttonBar.selectedSegmentIndex
        model.toggleThirdChannel(RED: index == 0,
                                 GREEN: index == 1,
                                 BLUE: index == 2)
        view.backgroundColor = model.getColor()
    }
    
    func getColorBar() -> UISegmentedControl {
        let buttonBar = UISegmentedControl(items: ["Red", "Green", "Blue", "None"])
        
        buttonBar.backgroundColor = UIColor(colorLiteralRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        buttonBar.tintColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        buttonBar.selectedSegmentIndex = 3
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        
        return buttonBar
    }
}

