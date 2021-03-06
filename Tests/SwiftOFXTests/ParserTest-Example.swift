//
//  ParserTest-Example.swift
//  
//
//  Created by Jon Lidgard on 12/04/2022.
//

import XCTest
@testable import SwiftOFX

class ParserTest_Example: XCTestCase {

  var data: Data!

  override func setUp() {
    super.setUp()
    guard let url = Bundle.module.url(forResource: "example", withExtension: "ofx") else {
      fatalError("Could not find example.ofx - needed for running the tests.")
    }
    data = try! Data(contentsOf: url)
  }

  func testExample() {
    let information = Finance(data: data)
    XCTAssertNotNil(information, "The OFX data should be properly parsed.")

    guard let info = information else { return }
    XCTAssertEqual(info.accounts.count, 0, "Expecting example.ofx to have no ACCOUNT entries.")
        XCTAssertEqual(info.bankAccounts.count, 1, "Expecting example.ofx to have one BANK ACCOUNT entry.")
        XCTAssertEqual(info.bankAccounts[0].statement.transactions.count, 2)
        XCTAssertEqual(info.creditAccounts.count, 1, "Expecting example.ofx to have one CREDIT ACCOUNT entry.")
        XCTAssertEqual(info.creditAccounts[0].statement.transactions.count, 1)
  }

}
