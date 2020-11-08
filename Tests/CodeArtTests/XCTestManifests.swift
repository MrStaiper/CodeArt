import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CodeArtColorTests.allTests),
        testCase(CodeArtNetworkingTests.allTests)
    ]
}
#endif
