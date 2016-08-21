//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIOffset: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: CGFloat...) {
        guard elements.count == 2 else { fatalError("2 `CGFloat`s required!") }
        
        horizontal = elements[0]
        vertical = elements[1]
    }
}
