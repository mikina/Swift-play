//
//  CustomNavigationController.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 5/2/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
  var swipeBackTransition: UIPercentDrivenInteractiveTransition!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.delegate = self
  }
  
  override func pushViewController(viewController: UIViewController, animated: Bool) {
    super.pushViewController(viewController, animated: animated)
    self.addBackGestureForController(viewController)    
  }
  
  func addBackGestureForController(vc: UIViewController) {
    let backGesture = UIPanGestureRecognizer(target: self, action: #selector(CustomNavigationController.handleBackGesture(_:)))
    vc.view.addGestureRecognizer(backGesture)
  }
  
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    print("animation for operation")
    if operation == .Pop {
      return SwipeAnimator()
    }
    
    return nil
  }

  func handleBackGesture(recognizer: UIPanGestureRecognizer) {
    var percent = recognizer.translationInView(recognizer.view).x / recognizer.view!.bounds.size.width
    var velocity = recognizer.velocityInView(recognizer.view).x
    
    percent = min(1, max(0, percent))
    velocity = min(1000, max(0, velocity))
    
    print("percent: \(percent), \(velocity)")
    if recognizer.state == .Began {
      self.swipeBackTransition = UIPercentDrivenInteractiveTransition()
      self.popViewControllerAnimated(true)
    }
    else if recognizer.state == .Changed {
      self.swipeBackTransition.updateInteractiveTransition(percent)
    }
    else if recognizer.state == .Cancelled || recognizer.state == .Ended {
      if percent >= 0.4 || velocity >= 100 {
        self.swipeBackTransition.finishInteractiveTransition()
      }
      else {
        self.swipeBackTransition.cancelInteractiveTransition()
      }
      
      self.swipeBackTransition = nil
    }
  }
  
  func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    if animationController.isKindOfClass(SwipeAnimator) {
      return self.swipeBackTransition
    }
    
    return nil
  }

}
