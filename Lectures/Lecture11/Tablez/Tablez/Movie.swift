//
//  Movie.swift
//  Tablez
//
//  Created by Robert Stjacques Jr on 10/24/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var title: String
    var releaseYear: Int
    
    init(_ title: String, _ releaseYear: Int) {
        self.title = title
        self.releaseYear = releaseYear
    }
}
