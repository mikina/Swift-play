//
//  DetailsViewController.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 7/17/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
  
  var item: Item? = nil
  @IBOutlet weak var photo: UIImageView!
  @IBOutlet weak var additionalDescription: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupView()
  }
  
  func setupView() {
    if let item = self.item {
      self.photo.image = UIImage(named: item.filename)
      self.additionalDescription.text = item.shortDescription
    }
  }
}
