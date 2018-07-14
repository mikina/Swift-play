//
//  DataManager.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/17/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class DataManager: NSObject {
  
  var items: [Item] = []
  
  func loadData() -> [Item] {
    let filePath = NSBundle.mainBundle().pathForResource("photos", ofType:"json")
    let data     = NSData(contentsOfFile:filePath!)
    
    let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: [])
    
    if let jsonData = json, items = jsonData["photos"] as? NSArray {
      for item in items {
        guard let photo = item["photo"] as? String else {
          continue
        }
        guard let author = item["author"] as? String else {
          continue
        }
        guard let location = item["location"] as? String else {
          continue
        }
        guard let shortDescription = item["description"] as? String else {
          continue
        }
        
        let newItem = Item(author: author, location: location, filename: photo, shortDescription: shortDescription)
        self.items.append(newItem)
      }
    }
    
    return self.items
  }
}
