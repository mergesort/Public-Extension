//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@nnnnnnnn](https://twitter.com/nnnnnnnn)
extension UnicodeScalar: Strideable {
    public func advanced(by n: Int) -> UnicodeScalar {
        return UnicodeScalar(UInt32(Int(value) + n))!
    }
    public func distance(to other: UnicodeScalar) -> Int {
        return Int(other.value) - Int(value)
    }
}
