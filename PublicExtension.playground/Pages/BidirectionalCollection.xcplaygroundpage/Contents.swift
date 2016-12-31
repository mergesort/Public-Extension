//: [Table of Contents](Table%20of%20Contents)

//: Inspired by [@irace](https://twitter.com/irace)
extension BidirectionalCollection where
    Iterator.Element: Equatable {
    
    func intersperse(producer: @autoclosure() -> Iterator.Element) -> [Iterator.Element] {
        var result = flatMap({ return [$0, producer()] })
        result.popLast()
        return result
    }
}
