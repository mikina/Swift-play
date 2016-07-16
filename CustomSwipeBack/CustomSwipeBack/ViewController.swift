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
    
    let item = Item(title: "test", filename: "test.jpg")
    
    self.tableViewCoordinator.reloadData([item])
  }
}

