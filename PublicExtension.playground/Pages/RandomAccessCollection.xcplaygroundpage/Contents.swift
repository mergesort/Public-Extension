//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@olebegemann](https://twitter.com/olebegemann)
extension RandomAccessCollection {
    var random: Iterator.Element? {
        guard count > 0 else { return nil }
        let offset = arc4random_uniform(numericCast(count))
        let i = index(startIndex, offsetBy: numericCast(offset))
        return self[i]
    }
}
