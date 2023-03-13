//
//  FaceView.swift
//  Happy
//
//  Created by donati on 13/03/2023.
//

import UIKit

@IBDesignable
class FaceView : UIView {
    var centreVisage : CGPoint {
        get {
            return convert(self.center, from: superview)
        }
    }
    
    var rayonVisage : CGFloat {
        get {
            return scaleFactor * min(self.bounds.width, self.bounds.height)/2
        }
    }
    
    @IBInspectable
    var scaleFactor : CGFloat = 0.9
    
    @IBInspectable
    var epaisseurTrait : CGFloat = 3 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var couleurTrait : UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        
        let facePath = UIBezierPath(arcCenter: centreVisage, radius: rayonVisage, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        facePath.lineWidth = epaisseurTrait
        couleurTrait.set()
        facePath.stroke()
        
        
    }


}
