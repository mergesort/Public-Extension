//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIWindow {
    func capture() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0.0);
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        layer.renderInContext(context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}