//
//  Item.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/16/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class Item: NSObject {
  let title: String
  let filename: String
  
  init(title: String, filename: String) {
    self.title = title
    self.filename = filename
  }
}
