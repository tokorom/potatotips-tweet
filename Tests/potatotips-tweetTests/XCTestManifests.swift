import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(potatotips_tweetTests.allTests),
    ]
}
#endif
