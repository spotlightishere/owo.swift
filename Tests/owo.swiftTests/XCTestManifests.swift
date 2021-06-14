import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(owo_swiftTests.allTests),
    ]
}
#endif
