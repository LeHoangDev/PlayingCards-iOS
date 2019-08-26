//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Manh Hoang Le on 20.08.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

    override func draw(_ rect: CGRect) {
        /*
        if let context = UIGraphicsGetCurrentContext(){
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0.0, endAngle: 2*CGFloat.pi, clockwise: true)
            context.setLineWidth(5.0)
            UIColor.green.setFill()
            UIColor.black.setStroke()
            context.strokePath()
            context.fillPath()
        }
         */
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX,y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.lineWidth = 5.0
        UIColor.green.setFill()
        UIColor.black.setStroke()
        path.stroke()
        path.fill()
        
    }
    

}
