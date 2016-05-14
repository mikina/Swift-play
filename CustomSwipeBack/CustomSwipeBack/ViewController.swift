//
//  ViewController.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 5/1/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
      super.viewDidAppear(animated)
    
      if self.view.gestureRecognizers?.count > 0 {
        var arrayOfGestureRecognizers: [UIGestureRecognizer] = self.view.gestureRecognizers! as NSArray as! [UIGestureRecognizer]
        
        for item in arrayOfGestureRecognizers {
          print("Gesture Recognizer:\(item)")
        }
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

