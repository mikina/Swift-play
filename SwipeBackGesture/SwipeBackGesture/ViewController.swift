//
//  ViewController.swift
//  SwipeBackGesture
//
//  Created by Mike Mikina on 4/23/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Top rated"
  }
  
  override func viewDidAppear(animated: Bool) {
    if let nav = self.navigationController as? CustomNavigationController {
      nav.showTabBar()
    }
  }
}

