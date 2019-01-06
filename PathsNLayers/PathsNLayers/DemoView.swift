//
//  DemoView.swift
//  PathsNLayers
//
//  Created by Maksim Nosov on 06/01/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class DemoView: UIView {

    var path: UIBezierPath!
    
    // Function for converting between the two is simple enough: multiply the number by Pi, then divide the result by 180.
    func deg2rad(_ number: Double) -> Double {
        return number * .pi / 180
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
//        simpleShapeLayer()
//        maskVSSublayer()
        twoShapes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func draw(_ rect: CGRect) {
//        // self.createRectangle()
//        // self.createTriangle()
//
//        // Create an oval shape path
//        // self.path = UIBezierPath(ovalIn: self.bounds)
//
//        // Create an circle shape path
////        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width / 2 - self.frame.size.height / 2,
////                                                y: 0.0,
////                                                width: self.frame.size.height,
////                                                height: self.frame.size.height))
//
//        // Create a rounded rectangle
//        // self.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15.0)
//
//        // Create a rounded rectangle (only top-left and bottom-right corners)
////        self.path = UIBezierPath(roundedRect: self.bounds,
////                                 byRoundingCorners: [.topLeft, .bottomRight],
////                                 cornerRadii: CGSize(width: 15.0, height: 0.0))
//
//        // Create an arc
////        self.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2),
////                                 radius: self.frame.size.height / 2,
////                                 startAngle: CGFloat(deg2rad(180.0)),
////                                 endAngle: CGFloat(deg2rad(0.0)),
////                                 clockwise: true)
//
//        self.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2),
//                                 radius: self.frame.size.height / 2,
//                                 startAngle: CGFloat(270.0).toRadians(),
//                                 endAngle: CGFloat(90.0).toRadians(),
//                                 clockwise: false)
//
//        // Specify the fill color and apply it to the path.
//        UIColor.orange.setFill()
//        path.fill()
//
//        path.lineWidth = 2.0
//        // Specify a border (stroke) color.
//        UIColor.purple.setStroke()
//        path.stroke()
//    }
    
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
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width / 2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    func simpleShapeLayer() {
        self.createRectangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func maskVSSublayer() {
        self.createTriangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        
//        self.layer.addSublayer(shapeLayer)
        
        self.backgroundColor = UIColor.green
        self.layer.mask = shapeLayer
    }
    
    func twoShapes() {
        let width: CGFloat = self.frame.size.width / 2
        let height: CGFloat = self.frame.size.height / 2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width / 2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width / 2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.yellow.cgColor
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.green.cgColor
        
//        shapeLayer2.position = CGPoint(x: 0.0, y: height)
        
        shapeLayer2.position = CGPoint(x: width / 2, y: height)
        shapeLayer1.position = CGPoint(x: width / 2, y: 0.0)
        
        shapeLayer1.bounds.origin = CGPoint(x: 0.0, y: 0.0)
        shapeLayer1.bounds.size = CGSize(width: 200.0, height: 150.0)
        shapeLayer1.backgroundColor = UIColor.magenta.cgColor
        
        shapeLayer1.bounds.origin = CGPoint(x: -20.0, y: -40.0)
        
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)
    }
    
}

extension CGFloat {
    // Convert from degrees to radians
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
