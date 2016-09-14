//
//  ViewControllerTransition.swift
//  ResearchViewControllerTransition
//
//  Created by mothule on 2016/09/14.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation
import UIKit

class MyTransitionDelegate : NSObject, UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return MyPresentedAnimater()
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return MyDismissedAnimater()
    }
}

class MyPresentedAnimater : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 1.0
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        guard let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else { return }
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else { return }
        guard let container = transitionContext.containerView() else { return }

        let imageView = UIImageView(image: UIImage(named: "hoge"))
        imageView.frame = CGRectZero        
        container.addSubview(toVC.view)
        container.addSubview(imageView)
        toVC.view.alpha = 0.0
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toVC.view.alpha = 1.0
            imageView.frame = CGRectMake(0, 350, 300, 200)
        }, completion: {_ in transitionContext.completeTransition(true)
        })
    }
}

class MyDismissedAnimater : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 1.0
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        transitionContext.completeTransition(true)
    }
}