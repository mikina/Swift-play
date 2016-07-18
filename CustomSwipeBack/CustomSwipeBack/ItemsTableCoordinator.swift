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
  var openItem: ((item: Item) -> ())?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  func setupView() {
    if self.tableView != nil {
      self.tableView.tableFooterView = nil
      self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    if self.delegate != nil {
      self.delegate.openItem = { item in
        if let openItem = self.openItem {
          openItem(item: item)
        }
      }
    }
  }
  
  func reloadData(data: [Item]) {
    self.dataSource.data = data;
    self.delegate.data = data;
    
    if data.count == 0 {
      self.tableView.hidden = true
    }
    else {
      self.tableView.hidden = false
      self.tableView.reloadData()
    }
  }
}
