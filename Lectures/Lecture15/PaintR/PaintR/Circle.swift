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

class Circle: DrawingTool {
    var shapeLayer: CAShapeLayer!
    
    init(start: CGPoint, color: UIColor) {
        super.init(start: start, color: color, brushSize: 0.0)
    }
    
    override func draw(on view: UIView) {
        let centerX = (start.x + finish.x) / 2.0
        let centerY = (start.y + finish.y) / 2.0
        
        let radius = sqrt( pow(start.x - centerX, 2) +
                           pow(start.y - centerY, 2))
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        if let shape = shapeLayer,
           let layers = view.layer.sublayers,
           let index = layers.index(of: shape) {
            view.layer.sublayers?.remove(at: index)
        }
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = color.cgColor
        shapeLayer.strokeColor = color.cgColor
        
        view.layer.addSublayer(shapeLayer)
    }
}

