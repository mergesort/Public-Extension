//: [Table of Contents](Table%20of%20Contents)

//: Adapted from [@kumo](https://twitter.com/kumo) and [@soffes](https://twitter.com/soffes)
extension UInt {
    private static let romanArabicPairs: [(romanValue: String, arabicValue: UInt)] = [
        (romanValue: "M", arabicValue: 1000),
        (romanValue: "CM", arabicValue: 900),
        (romanValue: "D", arabicValue: 500),
        (romanValue: "CD", arabicValue: 400),
        (romanValue: "C", arabicValue: 100),
        (romanValue: "XC", arabicValue: 90),
        (romanValue: "L", arabicValue: 50),
        (romanValue: "XL", arabicValue: 40),
        (romanValue: "X", arabicValue: 10),
        (romanValue: "IX", arabicValue: 9),
        (romanValue: "V", arabicValue: 5),
        (romanValue: "IV", arabicValue: 4),
        (romanValue: "I", arabicValue: 1)
    ]
    
    var romanNumeralRepresentation: String {
        var romanValue = ""
        var startingValue = self
        
        UInt.romanArabicPairs.forEach { pair in
            let quotient = startingValue / pair.arabicValue
            
            if quotient > 0 {
                (0..<quotient).forEach { _ in
                    romanValue += pair.romanValue
                }
                
                startingValue -= quotient*pair.arabicValue
            }
        }
        
        return romanValue
    }
}
