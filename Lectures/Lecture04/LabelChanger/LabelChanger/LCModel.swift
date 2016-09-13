//
//  LCModel.swift
//  LabelChanger
//
//  Created by Robert Stjacques Jr on 9/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

// the model for the basic application
class LCModel {
    // the values shared by both labels
    private static let LABELS = ["Longing",
                "Rusted",
                "Furnace",
                "Daybreak",
                "Seventeen",
                "Benign",
                "Nine",
                "Homecoming",
                "One",
                "Freight Car"]
    
    // the managers for both labels
    var firstLabels = StringManager(labels: LABELS, index: 0)
    var secondLabels = StringManager(labels: LABELS, index: 5)
    
    func getFirstLabel() -> String {
        return firstLabels.getNextString()
    }
    
    func getSecondLabel() -> String {
        return secondLabels.getNextString()
    }
}