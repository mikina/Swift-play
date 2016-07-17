//
//  ViewController.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 5/1/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var tableViewCoordinator: ItemsTableCoordinator!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setupView()
    
    self.tableViewCoordinator.setupView()
    let data = DataManager().loadData()
    self.tableViewCoordinator.reloadData(data)    
  }
  
  func setupView() {
    self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
    self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    self.navigationController?.navigationBar.alpha = 0
    self.navigationController?.navigationBar.shadowImage = UIImage()
  }
}

