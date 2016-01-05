//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension String {
    init<T>(stringInterpolationSegment expr: T?) {
        if let expr = expr {
            self = "\(expr)?"
        } else {
            self = "None"
        }
    }
}

extension String {
    func parseDate(format: String = "yyyy-MM-dd") -> NSDate? {
        // NSDateFormatter initialization is expensive, a shared formatter should be used for common formattings
        let formatter = NSDateFormatter()

        formatter.timeZone = .defaultTimeZone()
        formatter.dateFormat = format

        return formatter.dateFromString(self)
    }
}

extension String {
    /**
    Computes the reading time of `self`
    
    - parameter readingSpeed: Average reading speed in words per minute. Defaults to 250.
     
    - returns: Number of minutes to read `self`
    */
    func computeReadingTime(readingSpeed: Double = 250) -> Double {
        let words = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).filter { !$0.isEmpty }
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
        return stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
}
