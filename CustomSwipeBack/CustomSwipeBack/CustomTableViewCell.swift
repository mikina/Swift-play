//
//  CustomTableViewCell.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 6/5/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet weak var title: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
  }

  func setup(item: Item) {
    self.title.text = item.title
  }
}
