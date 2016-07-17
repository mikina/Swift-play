//
//  Item.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/16/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class Item: NSObject {
  let author: String
  let location: String
  let filename: String
  
  init(author: String, location: String, filename: String) {
    self.author = author
    self.location = location
    self.filename = filename
  }
}
