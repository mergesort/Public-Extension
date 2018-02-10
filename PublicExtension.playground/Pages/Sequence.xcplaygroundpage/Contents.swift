//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@aligatr](https://twitter.com/aligatr)
extension Sequence where Iterator.Element: Hashable {
    var uniques: AnySequence<Iterator.Element> {
        var seen = Set<Iterator.Element>()
        var underlyingIterator = makeIterator()
        
        return AnySequence {
            AnyIterator {
                while let next = underlyingIterator.next() {
                    if !seen.contains(next) {
                        seen.insert(next)
                        
                        return next
                    }
                }
                
                return nil
            }
        }
    }
}

//: Credit to [@khanlou](https://twitter.com/khanlou)
extension Sequence where SubSequence: Sequence, SubSequence.Iterator.Element == Iterator.Element {

    typealias Pair = (Element, Element)

    func consecutivePairs() -> AnySequence<Pair> {
        var iterator = self.makeIterator()
        guard var previous = iterator.next() else { return AnySequence([]) }
        return AnySequence({ () -> AnyIterator<Pair> in
            return AnyIterator({
                guard let next = iterator.next() else { return nil }
                defer { previous = next }
                return (previous, next)
            })
        })
    }
}
