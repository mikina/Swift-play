//
//  ItemsTableCoordinator.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/16/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ItemsTableCoordinator: NSObject {
  @IBOutlet var tableView: UITableView!
  @IBOutlet var dataSource: ItemsTableDataSource!
  @IBOutlet var delegate: ItemsTableDelegate!
  
  func reloadData(data: [Item]) {
    self.dataSource.data = data;
    
    if data.count == 0 {
      self.tableView.hidden = true
    }
    else {
      self.tableView.hidden = false
      self.tableView.reloadData()
    }
  }
}
