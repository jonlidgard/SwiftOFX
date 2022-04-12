import XCTest
@testable import SwiftOFX

class ParserTest-Barclays: XCTestCase {

  var data: Data!

  override func setUp() {
    super.setUp()
    guard let url = Bundle.module.url(forResource: "barclays", withExtension: "ofx") else {
      fatalError("Could not find example.ofx - needed for running the tests.")
    }
    data = try! Data(contentsOf: url)
  }

  func testBarclays() {
    let information = Finance(data: data)
    XCTAssertNotNil(information, "The OFX data should be properly parsed.")

    guard let info = information else { return }
    XCTAssertEqual(info.accounts.count, 0, "Expecting example.ofx to have no ACCOUNT entries.")
    XCTAssertEqual(info.bankAccounts.count, 1, "Expecting example.ofx to have one BANK ACCOUNT entry.")
//    XCTAssertEqual(info.bankAccounts[0].statement.transactions.count, 1)
//    XCTAssertEqual(info.creditAccounts.count, 0, "Expecting example.ofx to have one CREDIT ACCOUNT entry.")
//    XCTAssertEqual(info.creditAccounts[0].statement.transactions.count, 0)
  }
  
}
