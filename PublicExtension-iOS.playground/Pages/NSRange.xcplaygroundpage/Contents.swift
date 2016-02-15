//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension NSRange {
    init(range: Range<Int>) {
        location = range.startIndex
        length = range.endIndex - range.startIndex
    }
    
    var asRange: Range<Int> {
        return location..<location + length
    }
}
