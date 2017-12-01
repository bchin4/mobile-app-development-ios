//
//  DrawingTool.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

@objc protocol DrawingTool {
    
    init(start: CGPoint, color: UIColor, brushSize: CGFloat)
    
    func update(with aPoint: CGPoint)
    
    func finish(end: CGPoint)
    
    func draw(on aView: UIView)
    
    @objc optional func erase(from aView: UIView)
}
