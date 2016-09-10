//
//  main.swift
//  AppTemplate
//
//  Created by Mike Mikina on 9/10/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import Foundation
import UIKit

func isRunningTests() -> Bool {
  let environment = NSProcessInfo.processInfo().environment
  if environment["XCTestConfigurationFilePath"] != nil {
    return true
  }
  return false
}


class SpecAppDelegate: UIResponder, UIApplicationDelegate {
  
}

if isRunningTests() {
  UIApplicationMain(Process.argc, Process.unsafeArgv, NSStringFromClass(UIApplication), NSStringFromClass(SpecAppDelegate))
} else{
  UIApplicationMain(Process.argc, Process.unsafeArgv, NSStringFromClass(UIApplication), NSStringFromClass(AppDelegate))
}
