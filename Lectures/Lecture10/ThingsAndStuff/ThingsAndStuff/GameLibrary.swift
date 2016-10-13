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
        addGame("Diablo III", .ActionRPG, 2012)
        addGame("Metroid", .ActionRPG, 1986)
        addGame("Left 4 Dead", .TeamShooter, 2008)
        addGame("Half-Life 3", .FirstPersonShooter, 2097)
        addGame("Doom", .FirstPersonShooter, 2016)
        addGame("Borderlands", .ActionRPG, 2009)
        addGame("Orcs Must Die 2", .TowerDefense, 2012)
        
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
        if var gamesInGenre = games[game.genre] {
            gamesInGenre.append(game)
            games[game.genre] = gamesInGenre
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
