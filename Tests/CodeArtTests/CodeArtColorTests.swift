import XCTest
@testable import CodeArt

final class CodeArtColorTests: XCTestCase {
    func testColorPallete() {
        let color = CodeArt.ColorUtils.fromHexString(hex: "FF0000", alpha: 1.0)
        XCTAssertEqual(color, .red)
    }
    
    func testCodeArtEqual() {
        let color = CodeArt.ColorUtils.fromHexString(hex: "006736")
        XCTAssertEqual(color, CodeArt.ColorUtils.primaryColor)
    }
    
    func testSecondaryColorPallete () {
        let color = CodeArt.ColorUtils.fromHexString(hex: "FCFFFD")
        XCTAssertEqual(color, CodeArt.ColorUtils.secondaryColor)
    }

    static var allTests = [
        ("testColorPallete", testColorPallete),
        ("testCodeArtEqual", testCodeArtEqual),
        ("testSecondaryColorPallete", testSecondaryColorPallete),
    ]
}
