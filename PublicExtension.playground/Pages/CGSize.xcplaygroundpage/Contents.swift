//: [Table of Contents](Table%20of%20Contents)

import UIKit

/*

Enum raw values must conform to `Equatable` and be literal convertible from
“strings, characters, or any of the integer or floating-point number types.”

*/

//: Inspired by [@terhechte](https://twitter.com/terhechte)
extension CGSize: StringLiteralConvertible {
    public init(stringLiteral value: String) {
        let size = CGSizeFromString(value)
        self.init(width: size.width, height: size.height)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        let size = CGSizeFromString(value)
        self.init(width: size.width, height: size.height)
    }

    public init(unicodeScalarLiteral value: String) {
        let size = CGSizeFromString(value)
        self.init(width: size.width, height: size.height)
    }
}

//: Inspired by [@soffes](https://twitter.com/soffes)
extension CGSize {
    func aspectFit(boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width*minRatio, height: height*minRatio)
    }
}

//: Credit to [@rolandleth](https://twitter.com/rolandleth)
extension CGSize {
    var delta: CGFloat {
        return 0.1 // Customize to your needs
    }
    
    var isCompact: Bool { return height > width + delta }
    var isWide: Bool { return width > height + delta }
    var isSquare: Bool { return abs(width - height) < delta }
}
