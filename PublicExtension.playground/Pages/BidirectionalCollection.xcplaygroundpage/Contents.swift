//: [Previous](@previous)

//: Inspired by [@irace](https://twitter.com/irace)
extension BidirectionalCollection where
    Iterator.Element: Equatable {
    
    func intersperse(producer: @noescape () -> Iterator.Element) -> [Iterator.Element] {
        return reduce([]) { accumulated, next in
            return accumulated +
                [next] +
                (next != last! ? [producer()] : [])
        }
    }
}