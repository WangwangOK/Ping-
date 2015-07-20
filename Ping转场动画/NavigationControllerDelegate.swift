//
//  NavigationControllerDelegate.swift
//  Ping转场动画
//
//  Created by Vivien on 15/7/20.
//  Copyright (c) 2015年 wangwang. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject,UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if(operation == UINavigationControllerOperation.Push){
            return AnimationTrasition()
        }else{
            return BackAnimationTrasition()
        }
    }
   
}
