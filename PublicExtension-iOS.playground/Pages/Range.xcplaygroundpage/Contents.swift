//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension Range {
    var indexPathRange: [NSIndexPath] {
        return self.map {
            guard let castedIndex = $0 as? Int else { fatalError("Only Ints allowed for NSIndexPaths!") }

            return NSIndexPath(forRow: castedIndex, inSection: 0)
        }
    }
}