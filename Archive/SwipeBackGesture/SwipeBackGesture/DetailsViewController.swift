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
    if let nav = self.navigationController as? CustomNavigationController {
      nav.hideTabBar()
    }
  }
  

  
}
