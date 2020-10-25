import XCTest

#if !canImport(ObjectiveC)
  public func allTests() -> [XCTestCaseEntry] {
    return [
      testCase(PotatotipsTweetTests.allTests)
    ]
  }
#endif
