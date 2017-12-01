//
//  Squiggle.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class Squiggle: NSObject, DrawingTool {
    var points = [CGPoint]()
    
    let color: UIColor
    let brushSize: CGFloat
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        points.append(start)
        
        self.color = color
        self.brushSize = brushSize
    }
    
    func update(with aPoint: CGPoint) {
        points.append(aPoint)
    }
    
    func finish(end: CGPoint) {
        points.append(end)
    }
    
    func draw(on aView: UIView) {
        color.setStroke()
        let path = UIBezierPath()
        path.lineWidth = brushSize
        path.lineCapStyle = CGLineCap.round

        path.move(to: points.first!)
        for i in 1..<points.count {
            path.addLine(to: points[i])
            path.move(to: points[i])
        }


        path.stroke()
    }
}
