//: [Table of Contents](Table%20of%20Contents)

import UIKit

protocol Container {
    var isEmpty: Bool { get }
}

extension String: Container {} // String already has an `isEmpty` property

// Example with `Array`

extension Array: Container {
    var isEmpty: Bool {
        return count == 0
    }
}

extension Optional where Wrapped: Container {
    var isNilOrEmpty: Bool {
        switch self {
        case .None:
            return true
        case .Some(let unwrapped):
            return unwrapped.isEmpty
        }
    }
}