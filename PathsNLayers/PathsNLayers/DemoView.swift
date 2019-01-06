//
//  DemoView.swift
//  PathsNLayers
//
//  Created by Maksim Nosov on 06/01/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

@IBDesignable class DemoView: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specigy the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the botto, line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    override func draw(_ rect: CGRect) {
        self.createRectangle()
        
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill()
        path.fill()
        
        path.lineWidth = 5.0
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
    }
}
