//
//  DetailsViewController.swift
//  SwipeBackGesture
//
//  Created by Mike Mikina on 4/23/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Details page"
    self.hideTabBar()
  }
  
  override func viewWillDisappear(animated: Bool) {
    self.showTabBar()
  }

  func hideTabBar() {
    if let tabBar = self.tabBarController?.tabBar {
      UIView.animateWithDuration(0.3, animations: {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height + tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height)
      })
    }
  }
  
  func showTabBar() {
    if let tabBar = self.tabBarController?.tabBar {
      UIView.animateWithDuration(0.3, animations: {
        tabBar.frame = CGRectMake(tabBar.frame.origin.x, UIScreen.mainScreen().bounds.size.height - tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height)
      })
    }
  }
  
}
