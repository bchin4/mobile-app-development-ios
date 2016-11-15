//
//  Surface.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Surface: UIView {
    static let DEFAULT_BRUSH_SIZE = CGFloat(5.0)
    static let MAXIMUM_BRUSH_SIZE = CGFloat(180)
    
    var currentType: DrawingToolType = .SQUIGGLE
    var currentDrawingTool: DrawingTool?
    var drawingTools = [DrawingTool]()
    var redoHistory = [DrawingTool]()
    var brushSize = DEFAULT_BRUSH_SIZE
    
    
    
    func setCurrentDrawingTool(drawingTool type: DrawingToolType) {
        currentType = type
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        currentDrawingTool = DrawingToolFactory.makeTool(type: currentType, start: location, color: UIColor.red, size: brushSize)
        drawingTools.append(currentDrawingTool!)
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        if let tool = currentDrawingTool {
            tool.finish = location
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentDrawingTool = nil
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        for drawingTool in drawingTools {
            drawingTool.draw(on: self)
        }
    }
}
