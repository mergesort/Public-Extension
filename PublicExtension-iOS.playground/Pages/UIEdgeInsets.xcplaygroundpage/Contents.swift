//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIEdgeInsets: ArrayLiteralConvertible {
    public init(arrayLiteral elements: CGFloat...) {
        guard elements.count == 4 else { fatalError("4 CGFloats required!") }

        top = elements[0]
        left = elements[1]
        bottom = elements[2]
        right = elements[3]
    }
}