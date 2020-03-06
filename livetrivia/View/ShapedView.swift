//
//  ShapedView.swift
//  livetrivia
//
//  Created by macbook on 22/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class ShapedView: UIView {
    
    let subLayer: CAShapeLayer = {
        let subLayer = CAShapeLayer()
        subLayer.fillColor = UIColor.white.withAlphaComponent(0.20).cgColor
        return subLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {

        layer.addSublayer(subLayer)
        subLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        
        setPath2()

    }

    override func layoutSubviews() {
        super.layoutSubviews()

        subLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
                
        setPath2()
    }

//    private func setPath() {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x:0, y:bounds.height))
//        path.addQuadCurve(to: CGPoint(x:bounds.width, y:bounds.height), controlPoint: CGPoint(x:bounds.width/2, y:4*bounds.height/5))
//        path.addLine(to: CGPoint(x:bounds.width, y:0))
//        path.addLine(to: CGPoint(x:0, y:0))
//        subLayer.path = path.cgPath
//    }
//
    private func setPath2() {
        
        var path = UIBezierPath()
        path.move(to: CGPoint(x:bounds.width, y:0))
        path.addQuadCurve(to: CGPoint(x:bounds.width, y:bounds.height), controlPoint: CGPoint(x:4*bounds.width/5, y:bounds.height/2))
        path.addLine(to: CGPoint(x:0, y:bounds.height))
        path.addLine(to: CGPoint(x:0, y:0))
        subLayer.path = path.cgPath
    
        path.close()

      }
    
}
