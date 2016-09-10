//
//  SampleSpec.swift
//  AppTemplate
//
//  Created by Mike Mikina on 9/10/16.
//  Copyright © 2016 FDT. All rights reserved.
//

import Foundation

import UIKit
import Quick
import Nimble

class SampleSpec: QuickSpec {
        
  override func spec() {
    
    describe("sample test") {
      context("truth") {
        it("expect truth to be truth") {
          expect(true).to(equal(true))
        }
      }
    }
  }
}
