//
//  GameSection.swift
//  ThingsAndStuff
//
//  Created by Robert Stjacques Jr on 10/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

struct GameSection {
    var genre: Genre
    var games: [Game]
    
    init(genre: Genre, games: [Game]) {
        self.genre = genre
        self.games = games
    }
}
