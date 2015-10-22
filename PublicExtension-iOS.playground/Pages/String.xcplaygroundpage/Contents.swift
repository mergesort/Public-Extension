//: [Table of Contents](Table%20of%20Contents)

import UIKit

// MARK: - StringInterpolationConvertible for Optional<T>

extension String {
    init<T>(stringInterpolationSegment expr: T?) {
        if let expr = expr {
            self = "\(expr)?"
        } else {
            self = "None"
        }
    }
}

// MARK: - Date Formatting

extension String {
    func parseDate(format: String = "yyyy-MM-dd") -> NSDate? {
        // NSDateFormatter initialization is expensive, a shared formatter should be used for common formattings
        let formatter = NSDateFormatter()

        formatter.timeZone = .defaultTimeZone()
        formatter.dateFormat = format

        return formatter.dateFromString(self)
    }
}