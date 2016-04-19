//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@ZackShapiro](https://twitter.com/ZackShapiro)
extension NSDateFormatter: StringLiteralConvertible {
    public init(stringLiteral value: String) {
        self.init()
        dateFormat = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init()
        dateFormat = value
    }
    
    public init(unicodeScalarLiteral value: Self.UnicodeScalarLiteralType) {
        self.init()
        dateFormat = value
    }
}
