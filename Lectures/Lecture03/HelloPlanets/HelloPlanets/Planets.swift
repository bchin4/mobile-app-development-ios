//
//  Planets.swift
//  HelloPlanets
//
//  Created by Robert Stjacques Jr on 9/7/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

class Planets {
    private let planets = ["Mercury",
                           "Venus",
                           "Earth",
                           "Mars",
                           "Jupiter",
                           "Saturn",
                           "Uranus",
                           "Neptune"]
    
    private var planetIndex = -1
    
    func getNextPlanet() -> String {
        planetIndex = planetIndex + 1
        if planetIndex == planets.count {
            planetIndex = 0
        }
        return planets[planetIndex]
    }
}
