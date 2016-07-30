//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@soffes](https://twitter.com/soffes)
extension Date {
    var briefTimeAgoInWords: String {
        let components = Calendar.current.components(
            [.second, .minute, .hour, .day, .year], from: self, to: Date(), options: [])
        
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
