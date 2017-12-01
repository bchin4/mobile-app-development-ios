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
    static let TRANSPARENT = UIColor(white: 1, alpha: 0).cgColor
    
    let color: UIColor
    let brushSize: CGFloat

    let path: UIBezierPath
    
    let shapeLayer: CAShapeLayer
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.color = color
        self.brushSize = brushSize
        
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = Squiggle.TRANSPARENT
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = brushSize
        
        path = UIBezierPath()
        path.move(to: start)
    }
    
    func update(with aPoint: CGPoint) {
        path.addLine(to: aPoint)
        
        shapeLayer.path = path.cgPath
    }
    
    func finish(end: CGPoint) {
        path.addLine(to: end)
        
        shapeLayer.path = path.cgPath
    }
    
    func draw(on aView: UIView) {
        erase(from: aView)
        
        aView.layer.addSublayer(shapeLayer)
    }
    
    func erase(from aView: UIView) {
        shapeLayer.removeFromSuperlayer()
    }
}
