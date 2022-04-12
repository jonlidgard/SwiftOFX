//
//  ValueTests.swift
//  
//
//  Created by Jon Lidgard on 12/04/2022.
//

import XCTest
@testable import SwiftOFX

class ValueTests: XCTestCase {

    func testDateDecoding() throws {

      let date1 = Date(string:"20170228180625")
      XCTAssertNotNil(date1, "Couldn't parse date")

      let date2 = Date(string:"20170228180625[-5:EST]")
      XCTAssertNotNil(date2, "Couldn't parse date with timezone")
    }
}
