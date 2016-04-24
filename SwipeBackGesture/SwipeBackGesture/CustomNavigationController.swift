//
//  CustomNavigationController.swift
//  SwipeBackGesture
//
//  Created by Mike Mikina on 4/24/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

  var tabBarHidden = false
  var animationLock = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    self.interactivePopGestureRecognizer?.delegate = self
    self.interactivePopGestureRecognizer?.addTarget(self, action: #selector(CustomNavigationController.backAction(_:)))
  }
  
  func backAction(gesture: UIPanGestureRecognizer) {
    
    if let gestureView = gesture.view, tabBar = self.tabBarController?.tabBar {
      let translation = gesture.translationInView(gestureView)
      let percent = Double(translation.x) / Double(tabBar.frame.size.width)
      let calculated = (tabBar.frame.size.height * CGFloat(percent))
      if !self.animationLock {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height - calculated, tabBar.frame.size.width, tabBar.frame.size.height)
      }
    }
  }
  
  func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
    if gestureRecognizer.isKindOfClass(UIScreenEdgePanGestureRecognizer.self)
      && self.viewControllers.count == 1 {
      return false
    }
    
    return true
  }

  func hideTabBar() {
    self.tabBarHidden = true
    self.animationLock = true
    if let tabBar = self.tabBarController?.tabBar {
      UIView.animateWithDuration(0.3, animations: {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height + tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height)
      }, completion: { (finished) in
        if finished {
          self.animationLock = false
        }
      })
    }
  }
  
  func showTabBar() {
    self.tabBarHidden = false
    self.animationLock = true
    if let tabBar = self.tabBarController?.tabBar {
      UIView.animateWithDuration(0.3, animations: {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height - tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height)
      }, completion: { (finished) in
        if finished {
          self.animationLock = false
        }
      })
    }
  }

  func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    if let coordinator = navigationController.topViewController?.transitionCoordinator() {
      coordinator.notifyWhenInteractionEndsUsingBlock({ (context) in
        if context.isCancelled() {
          self.hideTabBar()
        }
      })
    }
    
  }
}
