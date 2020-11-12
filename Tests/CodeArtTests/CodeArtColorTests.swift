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
    
    func testGradientView () {
        let colors = [CodeArt.ColorUtils.fromHexString(hex: "006736"), CodeArt.ColorUtils.fromHexString(hex: "FCFFFD")]
        let gradientView = CodeArt.ColorUtils.setGradientView(view: UIView(), colors: colors)
        XCTAssertEqual(gradientView.backgroundColor, CodeArt.ColorUtils.setGradientView(view: UIView(), colors: colors).backgroundColor)
    }

    static var allTests = [
        ("testColorPallete", testColorPallete),
        ("testCodeArtEqual", testCodeArtEqual),
        ("testSecondaryColorPallete", testSecondaryColorPallete),
    ]
}
