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

class Line: DrawingTool {
    init(start: CGPoint, color: UIColor) {
        super.init(start: start, color: color, brushSize: 5.0 )
    }
    
    override func draw(on: UIView) {
        color.setStroke()
        let path = UIBezierPath()
        path.lineWidth = brushSize
        path.lineCapStyle = CGLineCap.round
        
        path.move(to: start)
        path.addLine(to: finish)
        path.stroke()
    }
}
