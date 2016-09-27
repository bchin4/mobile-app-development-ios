//
//  Colors.swift
//  YAAA
//
//  Created by Robert Stjacques Jr on 9/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Colors {
    var rChannel = [false, false, false]
    var gChannel = [false, false, false]
    var bChannel = [false, false, false]
    
    func toggleFirstChannel(R r: Bool, G g: Bool, B b: Bool) {
        rChannel[0] = r
        gChannel[0] = g
        bChannel[0] = b
    }
    
    func toggleSecondChannel(R r: Bool, G g: Bool, B b: Bool) {
        rChannel[1] = r
        gChannel[1] = g
        bChannel[1] = b
    }
    
    func toggleThirdChannel(R r: Bool, G g: Bool, B b: Bool) {
        rChannel[2] = r
        gChannel[2] = g
        bChannel[2] = b
    }
    
    func getColor() -> UIColor {
        var r: Float = 0.0
        var g: Float = 0.0
        var b: Float = 0.0
        
        for c in rChannel {
            if c {
                r += 0.33
            }
        }
        
        for c in gChannel {
            if c {
                g += 0.33
            }
        }
        
        for c in bChannel {
            if c {
                b += 0.33
            }
        }
        
        return UIColor(colorLiteralRed: r, green: g, blue: b, alpha: 1.0)
        
    }
}
