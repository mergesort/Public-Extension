//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@soffes](https://twitter.com/soffes)
extension Date {
    var briefTimeAgoInWords: String {
        let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .year], from: self, to: Date())
        
        if let year = components.year, year > 0 {
            return "\(components.year)y"
        }
        
        if let day = components.day, day > 0 {
            return "\(components.day)d"
        }
        
        if let hour = components.hour, hour > 0 {
            return "\(components.hour)h"
        }
        
        if let minute = components.minute, minute > 0 {
            return "\(components.minute)m"
        }
        
        return "\(components.second)s"
    }
}

//: Credit to [@ericasadun](https://twitter.com/ericasadun)
extension Date {
    var isPast: Bool { return self < Date() }
    var isFuture: Bool { return self > Date() }
    
    // More at https://github.com/erica/NSDate-Extensions
}
