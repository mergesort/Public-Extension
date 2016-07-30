//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension String {
    init<T>(stringInterpolationSegment expr: T?) {
        if let expr = expr {
            self = "\(expr)?"
        }
        else {
            self = "None"
        }
    }
}

extension String {
    func parseDate(format: String = "yyyy-MM-dd") -> Date? {
        // NSDateFormatter initialization is expensive, a shared formatter should be used for common formattings
        let formatter = DateFormatter()

        formatter.timeZone = .`default`
        formatter.dateFormat = format

        return formatter.date(from: self)
    }
}

extension String {
    func computeReadingTime(readingSpeed: Double = 250) -> Double {
        let words = components(separatedBy: CharacterSet.whitespaces).filter { !$0.isEmpty }
        return Double(words.count) / readingSpeed
    }
}

//: Credit to [@ericasadun](https://twitter.com/ericasadun)
extension String {
    // Force String to NSString
    var ns: NSString {
        return self as NSString
    }
}

extension NSString {
    // Force NSString to String
    var swift: String {
        return self as String
    }
}

extension String {
    var trimmedString: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    var reversedString: String {
        return String(characters.reversed())
    }
}
