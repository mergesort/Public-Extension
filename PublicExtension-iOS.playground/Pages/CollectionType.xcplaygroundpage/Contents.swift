//: [Table of Contents](Table%20of%20Contents)

extension CollectionType where
    Index == Int,
    Generator.Element.Index == Int,
    Generator.Element: CollectionType {

    // Performs an eager transpose of `self`. Uses `nil` as a placeholder, when transposing a jagged array
    func transpose() -> [[Generator.Element.Generator.Element?]] {
        guard let maxRowSize = maxElement({ $0.count < $1.count })?.count else { return [] }

        var result: [[Generator.Element.Generator.Element?]] = []
        result.reserveCapacity(maxRowSize)

        var currentColumnIndex = 0
        while currentColumnIndex < maxRowSize {
            var transposed: [Generator.Element.Generator.Element?] = []
            transposed.reserveCapacity(count)

            transposed.appendContentsOf(indices.map { index -> Generator.Element.Generator.Element? in
                currentColumnIndex < self[index].count ? self[index][currentColumnIndex] : nil
            })

            result.append(transposed)
            currentColumnIndex++
        }
        
        return result
    }
}

//: Credit to [@brentdax](https://twitter.com/brentdax)
extension CollectionType where Index: Comparable {
    subscript(safe index: Index) -> Generator.Element? {
        guard index >= startIndex && index < endIndex else {
            return nil
        }
        
        return self[index]
    }
}

//: Credit to [@UINT_MIN](https://twitter.com/UINT_MIN)
extension CollectionType where Generator.Element: Comparable {
    var maxIndex: Index? {
        return indices.maxElement { self[$0] < self[$1] }
    }
}

//: Credit to [@oisdk](https://twitter.com/oisdk)
extension CollectionType where Index: BidirectionalIndexType {
    func lastIndexOf(@noescape isElement: Generator.Element -> Bool) -> Index? {
        for index in indices.reverse() where isElement(self[index]) {
            return index
        }
        
        return nil
    }
}

//: Credit to [@airspeedswift](https://twitter.com/airspeedswift)
extension CollectionType
    where
        Generator.Element: Equatable,
        Index: RandomAccessIndexType,
        SubSequence.Generator.Element == Generator.Element {
    func search<
            Other: CollectionType
            where
                Other.Index: RandomAccessIndexType,
                Other.Index.Distance == Index.Distance,
                Other.Generator.Element == Generator.Element
        >(pat: Other) -> Index? {
            guard !isEmpty && pat.count <= count else { return nil }
            
            for i in startIndex...endIndex.advancedBy(-pat.count) {
                if self.suffixFrom(i).startsWith(pat) {
                    return i
                }
            }
            
            return nil
        }
}

[1, 2, 3].search([2, 3]) // Results in 1
