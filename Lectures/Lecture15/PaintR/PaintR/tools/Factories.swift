//
//  Factories.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/9/17.
//  Copyright © 2017 Mobile Application Development. All rights reserved.
//

import UIKit

class CircleFactory: DrawingToolFactory {
    func makeDrawingTool(start: CGPoint, color: UIColor, size: CGFloat) -> DrawingTool {
        return Circle(start: start, color: color)
    }
}

class LineFactory: DrawingToolFactory {
    func makeDrawingTool(start: CGPoint, color: UIColor, size: CGFloat) -> DrawingTool {
        return Line(start: start, color: color, brushSize: size)
    }
}

class SquiggleFactory: DrawingToolFactory {
    func makeDrawingTool(start: CGPoint, color: UIColor, size: CGFloat) -> DrawingTool {
        return Squiggle(start: start, color: color, brushSize: size)
    }
}

class LassoFactory: DrawingToolFactory {
    func makeDrawingTool(start: CGPoint, color: UIColor, size: CGFloat) -> DrawingTool {
        return Lasso(start: start, color: color, brushSize: size)
    }
}

class ImageDrawingToolFactory: DrawingToolFactory {
    func makeDrawingTool() -> DrawingTool {
        return makeDrawingTool(start: CGPoint(x: 0, y: 0), color: UIColor.clear, size: 0)
    }
    
    func makeDrawingTool(start: CGPoint, color: UIColor, size: CGFloat) -> DrawingTool {
        return ImageDrawingTool(start: start, color: color, brushSize: size)
    }
}
