//
//  GameLibrary.swift
//  ThingsAndStuff
//
//  Created by Robert Stjacques Jr on 10/12/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class GameLibrary {
    var games = Dictionary<Genre, [Game]>()
    
    // convenience method to fill the library with a few games
    init() {
        addGame("Super Mario Bros.", .SideScroller, 1985)
        addGame("The Legend of Zelda", .ActionRPG, 1986)
        addGame("Mass Effect", .WesternRPG, 2007)
        addGame("Final Fantasy VII", .JRPG, 1994)
        addGame("The Witcher 3", .WesternRPG, 2015)
        addGame("Overwatch", .TeamShooter, 2016)
    }
    
    func getGenreCount() -> Int {
        return games.count
    }
    
    func getGameSections() -> [GameSection] {
        var sections = [GameSection]()
        for (genre, gamesInGenre) in games {
            let gameSection = GameSection(genre: genre, games: gamesInGenre)
            sections.append(gameSection)
        }
        return sections
    }
    
    func addGame(_ game: Game) {
        if var gamesInGenre = games[game.genre] {
            gamesInGenre.append(game)
        }
        else {
            let gamesInGenre = [game]
            games[game.genre] = gamesInGenre
        }
    }
    
    func addGame(_ name: String, _ genre: Genre, _ releaseYear: Int) {
        let game = Game(name, genre, releaseYear)
        addGame(game)
    }
}
