//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension NSRange {
    // Turns out this is in the standard library! https://twitter.com/PublicExtension/status/699945335586758656
    init(range: Range<Int>) {
        location = range.startIndex
        length = range.endIndex - range.startIndex
    }
    
    var asRange: Range<Int> {
        return location..<location + length
    }
}
