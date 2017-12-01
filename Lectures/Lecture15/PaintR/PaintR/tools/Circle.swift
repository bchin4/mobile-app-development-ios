//
//  Circle.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class Circle: NSObject, DrawingTool {
    
    var shapeLayer: CAShapeLayer
    
    let start: CGPoint
    let color: UIColor
    let brushSize: CGFloat
    
    var end: CGPoint
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.start = start
        self.color = color
        self.brushSize = brushSize
        
        end = start
        
        shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 5
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = color.cgColor
    }
    
    convenience init(start: CGPoint, color: UIColor) {
        self.init(start: start, color: color, brushSize: CGFloat(5))
    }
    
    func finish(end: CGPoint) {
        self.end = end
        shapeLayer.fillColor = color.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.path = makeCirclePath()
    }
    
    func update(with aPoint: CGPoint) {
        self.end = aPoint
    }
    
    func draw(on aView: UIView) {
        erase(from: aView)
        
        shapeLayer.path = makeCirclePath()

        aView.layer.addSublayer(shapeLayer)
    }
    
    func erase(from aView: UIView) {
        shapeLayer.removeFromSuperlayer()
    }
    
    func makeCirclePath() -> CGPath {
        let centerX = (start.x + end.x) / 2.0
        let centerY = (start.y + end.y) / 2.0
        
        let radius = sqrt( pow(start.x - centerX, 2) +
            pow(start.y - centerY, 2))
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        circlePath.lineWidth = brushSize
        
        return circlePath.cgPath
    }
}

