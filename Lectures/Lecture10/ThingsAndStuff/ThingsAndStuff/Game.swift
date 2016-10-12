//
//  Game.swift
//  ThingsAndStuff
//
//  Created by Robert Stjacques Jr on 10/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Game: NSObject {
    var name: String
    var genre: String
    var releaseYear: Int
    var rating: Int
    
    init(_ name: String, _ genre: String,
         _ releaseYear: Int, _ rating: Int) {
        self.name = name
        self.genre = genre
        self.releaseYear = releaseYear
        self.rating = rating
    }
    
    convenience init(_ name: String, _ genre: String,
                     _ releaseYear: Int) {
        self.init(name, genre, releaseYear, 0)
    }
}
