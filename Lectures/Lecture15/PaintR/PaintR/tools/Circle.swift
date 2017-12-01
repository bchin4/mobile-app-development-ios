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
    
    var shapeLayer: CAShapeLayer?
    
    let start: CGPoint
    let color: UIColor
    
    var end: CGPoint
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.start = start
        self.color = color
        
        end = start
    }
    
    convenience init(start: CGPoint, color: UIColor) {
        self.init(start: start, color: color, brushSize: CGFloat(0))
    }
    
    func finish(end: CGPoint) {
        self.end = end
    }
    
    func update(with aPoint: CGPoint) {
        self.end = aPoint
    }
    
    func draw(on aView: UIView) {
        let centerX = (start.x + end.x) / 2.0
        let centerY = (start.y + end.y) / 2.0

        let radius = sqrt( pow(start.x - centerX, 2) +
                           pow(start.y - centerY, 2))

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)

        erase(from: aView)

        let aNewShapeLayer = CAShapeLayer()
        aNewShapeLayer.frame = aView.frame
        aNewShapeLayer.path = circlePath.cgPath

        aNewShapeLayer.fillColor = color.cgColor
        aNewShapeLayer.strokeColor = color.cgColor

        aView.layer.addSublayer(aNewShapeLayer)

        shapeLayer = aNewShapeLayer
    }
    
    func erase(from aView: UIView) {
        if let shape = shapeLayer,
            let layers = aView.layer.sublayers,
            let index = layers.index(of: shape) {
            aView.layer.sublayers?.remove(at: index)
        }
    }
}

