//
//  Planets.swift
//  HelloPlanets
//
//  Created by Robert Stjacques Jr on 9/7/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

//
// This class is the model (state and core application logic) for the
// "Hello, Planets!" app.
//
class Planets {
    // the  available planets, in order
    private let planets = ["Mercury",
                           "Venus",
                           "Earth",
                           "Mars",
                           "Jupiter",
                           "Saturn",
                           "Uranus",
                           "Neptune"]
    
    // the index of the current planet (set up to be Earth when the
    // app first loads
    private var planetIndex = 1
    
    // simple method to return the next planet.  If it gets to the
    // end of the array, it starts over
    func getNextPlanet() -> String {
        planetIndex = planetIndex + 1
        if planetIndex == planets.count {
            planetIndex = 0
        }
        return planets[planetIndex]
    }
    
    // simple method to return the appropriate "Hello" string based
    // on the current planet.
    func hello() -> String {
        return "Hello, " + planets[planetIndex] + "!"
    }
}
