//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension Range {
    func indexPathRange(section: Int = 0) -> [NSIndexPath] {
        return map {
            guard let castedIndex = $0 as? Int else { fatalError("Only Ints allowed for NSIndexPaths!") }

            return NSIndexPath(forRow: castedIndex, inSection: section)
        }
    }
}
