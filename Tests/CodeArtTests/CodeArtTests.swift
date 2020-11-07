import XCTest
@testable import CodeArt

final class CodeArtTests: XCTestCase {
    func testColorPallete() {
        let color = CodeArt.colorFromHexString(hex: "FF0000", alpha: 1.0)
        XCTAssertEqual(color, .red)
    }
    
    func testCodeArtEqual() {
        let color = CodeArt.colorFromHexString(hex: "006736")
        XCTAssertEqual(color, CodeArt.codeArtColor)
    }
    
    func testSecondaryColorPallete () {
        let color = CodeArt.colorFromHexString(hex: "FCFFFD")
        XCTAssertEqual(color, CodeArt.secondaryCodeArtColor)
    }

    static var allTests = [
        ("testColorPallete", testColorPallete),
        ("testCodeArtEqual", testCodeArtEqual),
        ("testSecondaryColorPallete", testSecondaryColorPallete),
    ]
}
