//
//  FreeShape.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/30/17.
//  Copyright © 2017 Mobile Application Development. All rights reserved.
//

import UIKit

class Lasso: NSObject, DrawingTool {
    static let TRANSPARENT = UIColor(white: 1, alpha: 0).cgColor
    
    let start: CGPoint
    let color: UIColor
    
    let path: CGMutablePath
    let brushSize: CGFloat
    
    var shapeLayer: CAShapeLayer
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        self.start = start
        self.color = color.withAlphaComponent(0.5)
        
        print(color)
        self.brushSize = brushSize
        
        path = CGMutablePath()
        path.move(to: start)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = Lasso.TRANSPARENT
    }
    
    func update(with aPoint: CGPoint) {
        path.addLine(to: aPoint)
        shapeLayer.path = path
    }
    
    func finish(end: CGPoint) {
        path.addLine(to: end)
        path.addLine(to: start)
        shapeLayer.path = path
        
        let translucentColor = color.withAlphaComponent(0.5).cgColor
        
        shapeLayer.strokeColor = translucentColor
        shapeLayer.fillColor = translucentColor
    }
    
    func draw(on aView: UIView) {
        // erase(from: aView)
        aView.layer.addSublayer(shapeLayer)
    }
    
    func erase(from aView: UIView) {
        if var layers = aView.layer.sublayers,
            let index = layers.index(of: shapeLayer) {
            layers.remove(at: index)
        }
    }
    
}
