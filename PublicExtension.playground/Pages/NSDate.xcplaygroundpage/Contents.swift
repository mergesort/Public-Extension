//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs) == .OrderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

//: Credit to [@soffes](https://twitter.com/soffes)
extension NSDate {
    var briefTimeAgoInWords: String {
        let components = NSCalendar.currentCalendar().components(
            [.Second, .Minute, .Hour, .Day, .Year], fromDate: self, toDate: NSDate(), options: [])
        
        if components.year > 0 {
            return "\(components.year)y"
        }
        
        if components.day > 0 {
            return "\(components.day)d"
        }
        
        if components.hour > 0 {
            return "\(components.hour)h"
        }
        
        if components.minute > 0 {
            return "\(components.minute)m"
        }
        
        return "\(components.second)s"
    }
}
