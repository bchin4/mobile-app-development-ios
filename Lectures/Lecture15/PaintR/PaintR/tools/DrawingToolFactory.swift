//
//  DrawingToolFactory.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

protocol DrawingToolFactory {
    func makeDrawingTool(start: CGPoint, color: UIColor, size: CGFloat) -> DrawingTool
}
