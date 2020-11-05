import XCTest
@testable import CodeArt

final class CodeArtTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CodeArt().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
