//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@aligatr](https://twitter.com/aligatr) and [@khanlou](https://twitter.com/khanlou)
extension Comparable {
    func clamp(interval: ClosedRange<Self>) -> Self {
        return interval.clamped(to: self...self).lowerBound
    }
    
    func clamp(interval: Range<Self>) -> Self {
        return interval.clamped(to: self..<self).upperBound
    }
}
