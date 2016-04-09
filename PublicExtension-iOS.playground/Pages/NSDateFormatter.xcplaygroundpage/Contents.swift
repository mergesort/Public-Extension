//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@ZackShapiro](https://twitter.com/ZackShapiro)
extension NSDateFormatter {
    convenience init(format: String) {
        self.init()
        
        dateFormat = format
    }
}

let formatter = NSDateFormatter(format: "yyyy")