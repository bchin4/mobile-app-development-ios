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
    static let DRAWING_TOOL_FACTORIES: [DrawingToolType:DrawingToolFactory] = {
        var factories = [DrawingToolType:DrawingToolFactory]()
        
        factories[DrawingToolType.CIRCLE] = CircleFactory()
        factories[DrawingToolType.LINE] = LineFactory()
        factories[DrawingToolType.SQUIGGLE] = SquiggleFactory()
        factories[DrawingToolType.LASSO] = LassoFactory()
        factories[DrawingToolType.IMAGE] = ImageDrawingToolFactory()
        
        return factories
    }()
    
    var currentType: DrawingToolType = .LINE
    var currentDrawingTool: DrawingTool?
    
    var drawingTools = [DrawingTool]()
    var redoHistory = [DrawingTool]()
    var brushSize = DEFAULT_BRUSH_SIZE
    
    var paintColor = UIColor.black
    
    func setCurrentDrawingTool(drawingTool type: DrawingToolType) {
        currentType = type
    }
    
    func addImage(image: UIImage) {
        let imageDrawingToolFactory = Surface.DRAWING_TOOL_FACTORIES[.IMAGE] as! ImageDrawingToolFactory
        let imageDrawingTool = imageDrawingToolFactory.makeDrawingTool() as! ImageDrawingTool
        imageDrawingTool.setImage(image: image)
        drawingTools.append(imageDrawingTool)
        setNeedsDisplay()
    }
    
    //
    // MARK: user touch handling functions
    //
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        let drawingToolFactory = Surface.DRAWING_TOOL_FACTORIES[currentType]!
        
        currentDrawingTool = drawingToolFactory.makeDrawingTool(start: location, color: paintColor, size: brushSize)
        drawingTools.append(currentDrawingTool!)
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        if let tool = currentDrawingTool {
            tool.update(with: location)
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        if let tool = currentDrawingTool {
            tool.finish(end: location)
        }
        currentDrawingTool = nil
        setNeedsDisplay()
    }
    
    //
    // MARK: drawing and erasing functions
    //
    
    override func draw(_ rect: CGRect) {
        for drawingTool in drawingTools {
            drawingTool.draw(on: self)
        }
    }
    
    func erase() {
        for tool in drawingTools {
            tool.erase(from: self)
        }
        drawingTools.removeAll()
        setNeedsDisplay()
    }
}
