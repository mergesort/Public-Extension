//: [Table of Contents](Table%20of%20Contents)

import UIKit

protocol Container {
    var isEmpty: Bool { get }
}

extension String: Container {} // String already has an `isEmpty` property
extension Array: Container {} // Array already has an `isEmpty` property via `CollectionType`

extension Optional where Wrapped: Container {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

//: Credit to [@pearapps](https://twitter.com/pearapps)
extension Optional {
    func iff(_ f: (Wrapped) -> Void) {
        switch self {
        case let .some(value):
            f(value)
        default:
            return
        }
    }
}
