import XCTest
@testable import CodeArt

final class CodeArtTests: XCTestCase {
    func testColorPallete() {
        let color = CodeArt.colorFromHexString(hex: "FF0000", alpha: 1.0)
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorPallete", testColorPallete),
    ]
}
