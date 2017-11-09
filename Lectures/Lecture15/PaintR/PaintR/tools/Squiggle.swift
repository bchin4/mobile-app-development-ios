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

class Squiggle: DrawingTool {
    var points = [CGPoint]()
    
    override var finish: CGPoint {
        didSet {
            points.append(finish)
        }
    }
    
    override init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        super.init(start: start, color: color, brushSize: brushSize)
        points.append(start)
    }
    
    override func draw(on: UIView) {
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
