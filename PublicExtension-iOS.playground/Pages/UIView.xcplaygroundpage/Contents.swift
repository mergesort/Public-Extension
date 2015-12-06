//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach(addSubview)
    }

    var frameHeight: CGFloat {
        return frame.height
    }

    var frameWidth: CGFloat {
        return frame.width
    }
}