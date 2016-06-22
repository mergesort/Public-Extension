//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@aligatr](https://twitter.com/aligatr)
extension SequenceType where Generator.Element: Hashable {
    var uniques: AnySequence<Generator.Element> {
        var seen = Set<Generator.Element>()
        var underlyingGenerator = generate()
        
        return AnySequence {
            AnyGenerator {
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
