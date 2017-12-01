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
    
    let shapeLayer: CAShapeLayer
    
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.start = start
        self.color = color
        self.brushSize = brushSize
        
        end = start
        
        shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
    }
    
    convenience init(start: CGPoint, color: UIColor) {
        self.init(start: start, color: color, brushSize: CGFloat(5))
    }
    
    func finish(end: CGPoint) {
        self.end = end
        updatePath()
    }
    
    func update(with aPoint: CGPoint) {
        end = aPoint
        updatePath()
    }
    
    func draw(on aView: UIView) {
        erase(from: aView)
        aView.layer.addSublayer(shapeLayer)
    }
    
    func updatePath() {
        let path = UIBezierPath()
        path.lineWidth = brushSize
        path.move(to: start)
        path.addLine(to: end)
        
        shapeLayer.path = path.cgPath
    }
    
    func erase(from aView: UIView) {
        shapeLayer.removeFromSuperlayer()
    }
}

