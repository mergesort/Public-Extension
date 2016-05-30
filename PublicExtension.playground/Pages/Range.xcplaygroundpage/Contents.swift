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

//: Credit to [@AirspeedSwift](https://twitter.com/AirspeedSwift)
extension Range {
    var mid: Element {
        return startIndex.advancedBy(
            startIndex.distanceTo(endIndex) / 2
        )
    }
}

//: Credit to [@calebd](https://twitter.com/calebd)
extension Range where Element.Distance == Element {
    func advanceBy(amount: Element) -> Range<Element> {
        return (startIndex + amount)..<(endIndex + amount)
    }
}
