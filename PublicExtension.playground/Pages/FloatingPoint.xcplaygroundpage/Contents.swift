//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@infinisil](https://twitter.com/infinisil)
extension FloatingPoint {
    /// - Note: For more information on subnormal (and normal numbers), see https://en.wikipedia.org/wiki/Denormal_number
    static var all: AnySequence<Self> {
        return AnySequence<Self> { () -> AnyIterator<Self> in
            var current = Self.leastNormalMagnitude
            return AnyIterator {
                guard !current.isInfinite else { return nil }
                defer { current = current.nextUp }
                return current
            }
        }
    }
}
