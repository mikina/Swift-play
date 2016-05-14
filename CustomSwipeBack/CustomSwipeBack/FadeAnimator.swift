//
//  FadeAnimator.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 5/3/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class FadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.35
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    guard let toView = transitionContext.viewForKey(UITransitionContextToViewKey) else {
      return
    }
    
    guard let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey) else {
      return
    }
    
    let containerView = transitionContext.containerView()
    
    toView.alpha = 0
    containerView?.addSubview(toView)
    
    UIView.animateWithDuration(0.35, animations: { 
      toView.alpha = 1
      }) { (finished) in
        fromView.removeFromSuperview()
        transitionContext.completeTransition(finished)
    }
    
  }
}
