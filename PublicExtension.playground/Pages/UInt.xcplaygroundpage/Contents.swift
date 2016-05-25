//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Adapted from [@kumo](https://twitter.com/kumo) and [@soffes](https://twitter.com/soffes)
extension UInt {
    var romanNumeralRepresentation: String {
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues: [UInt] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

        var romanValue = ""
        var startingValue = self
        
        for (index, romanChar) in romanValues.enumerate() {
            let arabicValue = arabicValues[index]
            let divisor = startingValue / arabicValue
            
            if divisor > 0 {
                (0..<divisor).forEach { _ in
                    romanValue += romanChar
                }
                
                startingValue -= divisor*arabicValue
            }
        }
        
        return romanValue
    }
}
