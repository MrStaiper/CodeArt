import Foundation
import UIKit

extension CodeArt {
    public class ColorUtils {
        /// The most eye-pleasing color known to all humanity
        public static var primaryColor: UIColor {
            return self.fromHexString(hex: "006736")
        }
        
        /// Returns an object of 'UIColor' with teh second most eye-pleasing color known to all humanity
        public static var secondaryColor: UIColor {
            return self.fromHexString(hex: "FCFFFD")
        }
        
        /// Allows you to convert a 6 digit hexadecimal string into a UIColor instance
        /// - Warning: The '#' symbol is stripped from the beginning of the string submitted here
        /// - Parameters:
        ///   - hex: A 6-digit hexadecimal string. Use 6 digits rather than 8, and add the accompanying alpha value in the second parameter
        ///   - alpha: A number between 0.0 and 1.0 indicating how transparente the color is
        /// - Returns: A UIColor defined by the 'hex' parameter
        internal class func fromHexString (hex: String, alpha: CGFloat = 1.0) -> UIColor {
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
        
        
        /// Allows you to get a gradient view with two or more color
        /// - Parameters:
        ///   - view: A view you wanto to apply gradient effects
        ///   - colors: Colors you want to add in your view
        /// - Returns: A UIView with gradient layer
        internal class func setGradientView(view: UIView, colors: [UIColor]) -> UIView {
            let gradient = CAGradientLayer()
            gradient.frame = view.bounds
            gradient.colors = colors
            view.layer.addSublayer(gradient)
            return view
        }
    }
}
