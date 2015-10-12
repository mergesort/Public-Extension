//: [Table of Contents](Table%20of%20Contents)

import UIKit

// MARK: - StringInterpolationConvertible for Optional<T>

extension String {
    init<T>(stringInterpolationSegment expr: Optional<T>) {
        if let expr = expr {
            self = "\(expr)?"
        } else {
            self = "None"
        }
    }
}