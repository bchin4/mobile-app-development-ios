//
//  Line.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class Line: NSObject, DrawingTool {
    let start: CGPoint
    let color: UIColor
    let brushSize: CGFloat
    
    var end: CGPoint
    
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.start = start
        self.color = color
        self.brushSize = brushSize
        
        end = start
    }
    
    convenience init(start: CGPoint, color: UIColor) {
        self.init(start: start, color: color, brushSize: CGFloat(5))
    }
    
    func finish(end: CGPoint) {
        self.end = end
    }
    
    func update(with aPoint: CGPoint) {
        end = aPoint
    }
    
    func draw(on aView: UIView) {
        color.setStroke()
        let path = UIBezierPath()
        path.lineWidth = brushSize
        path.lineCapStyle = CGLineCap.round
        
        path.move(to: start)
        path.addLine(to: end)
        path.stroke()
    }
}

