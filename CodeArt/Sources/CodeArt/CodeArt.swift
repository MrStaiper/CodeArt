import Foundation
import UIKit

class CodeArt {
    class func colorFromHexString (hex: String, alpha: CGFloat = 1.0) -> UIColor {
        let r, g, b: CGFloat
        let offset = hex.hasPrefix("#") ? 1 : 0
        let start = hex.index(hex.startIndex, offsetBy: offset)
        let hexColor = String(hex[start...])
        let scanner = Scanner(string: hexColor)
        var hexNumber : UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b = CGFloat((hexNumber & 0x0000ff)) / 255
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }
        return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
}
