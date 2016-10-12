//
//  GameLibrary.swift
//  ThingsAndStuff
//
//  Created by Robert Stjacques Jr on 10/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class GameLibrary {
    var games = [Game]()
    
    func addGame(_ game: Game) {
        games.append(game)
    }
    
    func addGame(_ name: String, _ genre: String, _ releaseYear: Int) {
        let game = Game(name, genre, releaseYear)
        addGame(game)
    }
}
