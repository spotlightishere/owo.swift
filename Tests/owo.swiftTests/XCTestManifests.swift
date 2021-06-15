import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(owo_swiftTests.allTests),
        ]
    }
#endif
