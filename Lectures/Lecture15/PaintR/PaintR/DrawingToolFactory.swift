//
//  DrawingToolFactory.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class DrawingToolFactory: NSObject {
    static func makeTool(type: DrawingToolType, start: CGPoint, color: UIColor, size: CGFloat ) -> DrawingTool? {
    
        switch(type) {
        case .LINE:
            return Line(start: start, color: color)
        case .SQUIGGLE:
            return Squiggle(start: start, color: color, brushSize: size)
        case .CIRCLE:
            return Circle(start: start, color: color)
        }
    }
}
