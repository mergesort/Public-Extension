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
        var size = boundingSize
        
        let widthRatio = boundingSize.width / width
        let heightRatio = boundingSize.height / height
        
        if widthRatio < heightRatio {
            size.height = boundingSize.width / width * height
        } else if heightRatio < widthRatio {
            size.width = boundingSize.height / height * width
        }
        
        return size
    }
}
