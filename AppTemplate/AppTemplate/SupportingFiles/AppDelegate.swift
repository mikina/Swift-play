//
//  AppDelegate.swift
//  AppTemplate
//
//  Created by Mike Mikina on 9/10/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.backgroundColor = UIColor.redColor()
    let vc = ViewController()
    self.window?.rootViewController = vc
    self.window?.makeKeyAndVisible()
    
    return true
  }

}
