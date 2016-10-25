//
//  Book.swift
//  Tablez
//
//  Created by Robert Stjacques Jr on 10/24/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Book: NSObject {
    var title: String
    var author: String
    
    init(_ title: String, _ author: String) {
        self.title = title
        self.author = author
    }
}
