//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@aligatr](https://twitter.com/aligatr) and [@khanlou](https://twitter.com/khanlou)
extension Comparable {
    func clamp(interval: ClosedInterval<Self>) -> Self {
        return interval.clamp(self...self).start
    }
    
    func clamp(interval: HalfOpenInterval<Self>) -> Self {
        return interval.clamp(self..<self).start
    }
}
