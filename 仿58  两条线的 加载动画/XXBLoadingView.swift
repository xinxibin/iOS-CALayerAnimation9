//
//  XXBLoadingView.swift
//  仿58  两条线的 加载动画
//
//  Created by Xinxibin on 16/7/13.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class XXBLoadingView: UIView {

    var shapeLayer:CAShapeLayer!
    var shapeLayer2:CAShapeLayer!

    var point:CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.point = self.center
        createRound()
        createRound2()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createRound()
        createRound2()
    }
    
    // 橘圆
    func createRound() {
        
        let path = UIBezierPath(ovalInRect: CGRectMake(point.x - 25, point.y - 25, 50, 50))
        
        shapeLayer              = CAShapeLayer()
        shapeLayer.frame        = CGRectMake(0, 0, 50, 50)
        shapeLayer.path         = path.CGPath
        shapeLayer.fillColor    = UIColor.clearColor().CGColor
        shapeLayer.strokeColor  = UIColor.orangeColor().CGColor
        shapeLayer.lineWidth    = 2
        shapeLayer.speed        = 0.5
        shapeLayer.lineCap      = kCALineCapButt
        self.layer.addSublayer(shapeLayer)
        
        animation1()
    }
    
    func animation1() {
        shapeLayer.strokeStart   = 0
        shapeLayer.strokeEnd     = 1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration  = 0.5
        animation.fromValue = 0
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.setValue("CABasicAnimationStrokeEnd", forKey: "animationName")
        shapeLayer.addAnimation(animation, forKey: "CABasicAnimationStrokeEnd")
    }
    
    func aniamtion2() {
        
        shapeLayer?.strokeStart = 1
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.duration  = 0.5
        animation.fromValue = 0
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.setValue("CABasicAnimationStrokeStart", forKey: "animationName")
        shapeLayer.addAnimation(animation, forKey: "CABasicAnimationStrokeStart")

    }
    
    // 红园
    func createRound2() {
        
        let path = UIBezierPath(arcCenter: CGPointMake(25, 25), radius: 12.5, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        
        shapeLayer2              = CAShapeLayer()
        shapeLayer2.backgroundColor = UIColor.clearColor().CGColor
        shapeLayer2.frame        = CGRectMake(0, 0, 50, 50)
        shapeLayer2.path         = path.CGPath
        shapeLayer2.fillColor    = UIColor.clearColor().CGColor
        shapeLayer2.strokeColor  = UIColor.redColor().CGColor
        shapeLayer2.lineWidth    = 2
        shapeLayer2.speed        = 0.5
        shapeLayer2.lineCap      = kCALineCapButt
        shapeLayer2.transform    = CATransform3DRotate(shapeLayer2.transform, CGFloat(M_PI), 0, 0, 1)
        self.layer.addSublayer(shapeLayer2)
        animation21()
    }

    func animation21() {
        shapeLayer2.strokeStart   = 0
        shapeLayer2.strokeEnd     = 1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration  = 0.5
        animation.fromValue = 0
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.setValue("CABasicAnimationStrokeEnd2", forKey: "animationName")
        shapeLayer2.addAnimation(animation, forKey: "CABasicAnimationStrokeEnd2")
    }
    
    func aniamtion22() {
        
        shapeLayer2?.strokeStart = 1
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.duration  = 0.5
        animation.fromValue = 0
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.setValue("CABasicAnimationStrokeStart2", forKey: "animationName")
        shapeLayer2.addAnimation(animation, forKey: "CABasicAnimationStrokeStart2")
        
    }
    
}

extension XXBLoadingView {
    
    func afterDelay() {
        aniamtion2()
        aniamtion22()

    }
    
    override func animationDidStart(anim: CAAnimation) {
        
        if anim.valueForKey("animationName") as? String == "CABasicAnimationStrokeEnd" {
            self.performSelector(#selector(self.afterDelay), withObject: nil, afterDelay: 0.35)
        }
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        if anim.valueForKey("animationName") as? String == "CABasicAnimationStrokeEnd" {
            
        } else if anim.valueForKey("animationName") as? String == "CABasicAnimationStrokeStart"{
            
            shapeLayer.removeAllAnimations()
            shapeLayer.removeFromSuperlayer()
            
            shapeLayer2.removeAllAnimations()
            shapeLayer2.removeFromSuperlayer()
            
            createRound()
            createRound2()
        }
        
    }
    
}






