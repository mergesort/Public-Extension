//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIEdgeInsets: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: CGFloat...) {
        guard elements.count == 4 else { fatalError("4 `CGFloat`s required!") }

        top = elements[0]
        left = elements[1]
        bottom = elements[2]
        right = elements[3]
    }
}

//: Suggested by [@al_skipp](https://twitter.com/al_skipp)
extension UIEdgeInsets {
    public init(uniform: CGFloat) {
        top = uniform
        left = uniform
        bottom = uniform
        right = uniform
    }
}
