//
//  ViewController.swift
//  CustomSwipeBack
//
//  Created by Mike Mikina on 5/1/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//      let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
//      self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(animated: Bool) {
      super.viewDidAppear(animated)
    
//      if self.view.gestureRecognizers?.count > 0 {
//        var arrayOfGestureRecognizers: [UIGestureRecognizer] = self.view.gestureRecognizers! as NSArray as! [UIGestureRecognizer]
//        
//        for item in arrayOfGestureRecognizers {
//          print("Gesture Recognizer:\(item)")
//        }
//      }
    }
  

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomTableViewCell
      cell.title?.text = "test"
      
      return cell
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

