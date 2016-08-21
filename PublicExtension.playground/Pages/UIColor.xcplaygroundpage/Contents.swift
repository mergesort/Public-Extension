//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIColor {
    convenience init(rgb: UInt32) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

//: Credit to [@soffes](https://twitter.com/soffes)
extension UIColor {
    var desaturated: UIColor {
        var hue = CGFloat(0), brightness = CGFloat(0), alpha = CGFloat(0)
        
        getHue(&hue, saturation: nil, brightness: &brightness, alpha: &alpha)
        
        return type(of: self).init(hue: hue, saturation: 0, brightness: brightness, alpha: alpha)
    }
}
