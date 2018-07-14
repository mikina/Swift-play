//
//  ItemsTableDataSource.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/16/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ItemsTableDataSource: NSObject, UITableViewDataSource {
  var data = [Item]()
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return (self.data.count == 0) ? 0 : 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cellItem = UITableViewCell()
    if let cell = tableView.dequeueReusableCellWithIdentifier(String(CustomTableViewCell), forIndexPath: indexPath) as? CustomTableViewCell {
      let item = self.data[indexPath.row]
      cell.setup(item)
      cellItem = cell
    }
    
    return cellItem
  }
}
