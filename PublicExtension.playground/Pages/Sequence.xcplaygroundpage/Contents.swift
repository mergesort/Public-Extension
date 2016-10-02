//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@aligatr](https://twitter.com/aligatr)
extension Sequence where Iterator.Element: Hashable {
    var uniques: AnySequence<Iterator.Element> {
        var seen = Set<Iterator.Element>()
        var underlyingGenerator = makeIterator()
        
        return AnySequence {
            AnyIterator {
                while let next = underlyingGenerator.next() {
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
