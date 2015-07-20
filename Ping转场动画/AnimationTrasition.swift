//
//  AnimationTrasition.swift
//  Ping转场动画
//
//  Created by Vivien on 15/7/20.
//  Copyright (c) 2015年 wangwang. All rights reserved.
//

import UIKit
class BackAnimationTrasition: NSObject,UIViewControllerAnimatedTransitioning {
    weak var transition:UIViewControllerContextTransitioning?
    var toController:UIViewController?
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transition = transitionContext
        
        var containerView = transitionContext.containerView()
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SecViewController
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! ViewController
        self.toController = toViewController
        var button = fromViewController.button
        
        containerView.addSubview(toViewController.view)
        containerView.addSubview(fromViewController.view)
        
        
        var circlrMashPathFinal = UIBezierPath(ovalInRect: button.frame);
        var extremePoint = CGPointMake(button.center.x - CGRectGetWidth(toViewController.view.bounds), button.center.y)
        var radius = sqrt(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y)
        var circleMaskPath = UIBezierPath(ovalInRect: CGRectInset(button.frame, -radius, -radius));
        
        var maskLayer = CAShapeLayer()
        maskLayer.path = circlrMashPathFinal.CGPath
        fromViewController.view.layer.mask = maskLayer
        
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPath.CGPath
        maskLayerAnimation.toValue = circlrMashPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transition?.completeTransition(true)
        //self.transition?.viewControllerForKey(UITransitionContextFromViewControllerKey)
    }
}

class AnimationTrasition: NSObject,UIViewControllerAnimatedTransitioning {
    weak var transition:UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transition = transitionContext
        
        var containerView = transitionContext.containerView()
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ViewController
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SecViewController
        var button = fromViewController.button
        containerView.addSubview(toViewController.view)
        

        
        var circleMaskPath = UIBezierPath(ovalInRect: button.frame);
        var extremePoint = CGPointMake(button.center.x - CGRectGetWidth(toViewController.view.bounds), button.center.y)
        var radius = sqrt(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y)
        var circlrMashPathFinal = UIBezierPath(ovalInRect: CGRectInset(button.frame, -radius, -radius));
        
        var maskLayer = CAShapeLayer()
        maskLayer.path = circlrMashPathFinal.CGPath
        toViewController.view.layer.mask = maskLayer
        
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPath.CGPath
        maskLayerAnimation.toValue = circlrMashPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transition?.completeTransition(true)
        self.transition?.viewControllerForKey(UITransitionContextFromViewControllerKey)
    }
}
