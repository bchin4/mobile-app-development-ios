//
//  ImageDrawingTool.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 12/1/17.
//  Copyright © 2017 Mobile Application Development. All rights reserved.
//

import UIKit

class ImageDrawingTool: DrawingTool {
    
    let layer: CALayer
    var image: UIImage?
    
    required init(start: CGPoint, color: UIColor, brushSize: CGFloat) {
        
        layer = CALayer()
        
    }
    
    func setImage(image: UIImage) {
        self.image = image
        layer.contents = image.cgImage
    }
    
    func update(with aPoint: CGPoint) {
        
    }
    
    func finish(end: CGPoint) {
        
    }
    
    func draw(on aView: UIView) {
        erase(from: aView)
        let viewFrame = aView.frame
        layer.frame = CGRect(x: 0, y: 0, width: viewFrame.width, height: viewFrame.height)
        
        aView.layer.addSublayer(layer)
    }
    
    func erase(from aView: UIView) {
        layer.removeFromSuperlayer()
    }
}
