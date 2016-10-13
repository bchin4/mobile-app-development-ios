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
        addGame("Chrono Trigger", .JRPG, 1995)
        addGame("Team Fortress 2", .TeamShooter, 2007)
        addGame("The Witcher 3", .WesternRPG, 2015)
        addGame("Overwatch", .TeamShooter, 2016)
    }
    
    func getGameSections() -> [GameSection] {
        var sections = [GameSection]()
        for (genre, gamesInGenre) in games {
            print("\(genre):\(gamesInGenre.count)")
            let gameSection = GameSection(genre: genre, games: gamesInGenre)
            sections.append(gameSection)
        }
        return sections
    }
    
    func addGame(_ game: Game) {
        print("TAS: adding \(game.name)")
        if var gamesInGenre = games[game.genre] {
            print("TAS: ****\(game.genre) is NOT empty, adding game")
            gamesInGenre.append(game)
            games[game.genre] = gamesInGenre
        }
        else {
            print("TAS: ----\(game.genre) is empty, adding \(game.name)")
            let gamesInGenre = [game]
            games[game.genre] = gamesInGenre
        }
    }
    
    func addGame(_ name: String, _ genre: Genre, _ releaseYear: Int) {
        let game = Game(name, genre, releaseYear)
        addGame(game)
    }
}
