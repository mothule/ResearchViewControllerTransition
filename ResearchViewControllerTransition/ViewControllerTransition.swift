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
        return 0.3
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        guard let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else { return }
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else { return }
        guard let container = transitionContext.containerView() else { return }

        let imageView = (fromVC as! FirstViewController).copyImageView()
        let destImageViewRect = (toVC as! SecondViewController).imageViewRect()
        container.addSubview(toVC.view)
        container.addSubview(imageView)
        toVC.view.alpha = 0.0
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.01, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [], animations: {
            toVC.view.alpha = 1.0
            imageView.frame = destImageViewRect
        }, completion: {_ in
            transitionContext.completeTransition(true)
        })
    }
}

class MyDismissedAnimater : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.3
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        transitionContext.completeTransition(true)
    }
}