//
//  DrawingTool.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class DrawingTool: NSObject {
    let start: CGPoint
    let color: UIColor
    let brushSize: CGFloat
    var finish: CGPoint
    
    init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.start = start
        self.color = color
        self.brushSize = brushSize
        finish = start
    }
    
    func draw(on: UIView) {
        // do nothing
    }
}
