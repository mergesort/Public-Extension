//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [Nate Cook](https://twitter.com/nnnnnnnn)
//: Make conforming to `StringLiteralConvertible` 3x easier using this trick
extension ExpressibleByStringLiteral where StringLiteralType == String {
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
