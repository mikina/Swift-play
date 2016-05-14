//
//  SwipeAnimator.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 5/3/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class SwipeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.35
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    guard let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
      return
    }
    
    guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else {
      return
    }
    
    let containerView = transitionContext.containerView()
    
    containerView?.addSubview(toVC.view)
    containerView?.bringSubviewToFront(fromVC.view)
    
    toVC.view.frame = transitionContext.finalFrameForViewController(toVC)

    let mask = UIView(frame: CGRectMake(0, 0, toVC.view.frame.size.width, toVC.view.frame.size.height))
    mask.backgroundColor = UIColor.blackColor()
    mask.alpha = 0.3
    toVC.view.addSubview(mask)
    
    toVC.view.frame = CGRectMake(-50, toVC.view.frame.origin.y, toVC.view.frame.size.width, toVC.view.frame.size.height)
    
    UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
      fromVC.view.frame = CGRectMake(toVC.view.frame.size.width, fromVC.view.frame.origin.y, fromVC.view.frame.size.width, fromVC.view.frame.size.height)
      toVC.view.frame = CGRectMake(0, toVC.view.frame.origin.y, toVC.view.frame.size.width, toVC.view.frame.size.height)
      mask.alpha = 0
    }) { (finished) in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
      mask.removeFromSuperview()
    }
  }
}
