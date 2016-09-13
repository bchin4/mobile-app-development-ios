//
//  StringManager.swift
//  LabelChanger
//
//  Created by Robert Stjacques Jr on 9/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

// a struct that provides the same basic functionality as 
// the "planets" model from the previous lecture.  this is
// more generic and reusable.
struct StringManager {
    // an array of labels
    let labels: [String]
    // the current index
    var index: Int
    
    // returns the next string in the sequence.  respects
    // the original index choice
    mutating func getNextString() -> String {
        if index == labels.count {
            index = 0
        }
        let value = labels[index]
        index = index + 1
        return value
    }
}
