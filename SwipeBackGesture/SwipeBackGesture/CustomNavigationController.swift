//
//  CustomNavigationController.swift
//  SwipeBackGesture
//
//  Created by Mike Mikina on 4/24/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UIGestureRecognizerDelegate {

  var tabBarHidden = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.interactivePopGestureRecognizer?.delegate = self
    self.interactivePopGestureRecognizer?.addTarget(self, action: #selector(CustomNavigationController.backAction(_:)))
  }
  
  func backAction(gesture: UIPanGestureRecognizer) {
    
    if let gestureView = gesture.view, tabBar = self.tabBarController?.tabBar {
      let translation = gesture.translationInView(gestureView)
      let percent = Double(translation.x) / Double(tabBar.frame.size.width)
      let calculated = (tabBar.frame.size.height * CGFloat(percent))
      tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height - calculated, tabBar.frame.size.width, tabBar.frame.size.height)
    }
  }

  func hideTabBar() {
    self.tabBarHidden = true
    if let tabBar = self.tabBarController?.tabBar {
      UIView.animateWithDuration(0.3, animations: {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height + tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height)
      })
    }
  }
  
  func showTabBar() {
    self.tabBarHidden = false
    if let tabBar = self.tabBarController?.tabBar {
      UIView.animateWithDuration(0.3, animations: {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height - tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height)
      })
    }
  }

}
