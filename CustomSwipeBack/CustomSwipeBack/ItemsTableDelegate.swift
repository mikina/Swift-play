//
//  ItemsTableDelegate.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/16/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ItemsTableDelegate: UIControl, UITableViewDelegate {
  var data = [Item]()
  var openItem: ((item: Item) -> ())?
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let item = self.data[indexPath.row]
    if let openItem = self.openItem {
      openItem(item: item)
    }
  }
}
