//: [Table of Contents](Table%20of%20Contents)

extension Collection where
    Index == Int,
    IndexDistance == Int,
    Iterator.Element.IndexDistance == Int,
    Iterator.Element: Collection,
    Iterator.Element.Index == Int,
    Indices.Iterator.Element == Int {
    
    // Performs an eager transpose of `self`. Uses `nil` as a placeholder, when transposing a jagged array
    func transpose() -> [[Iterator.Element.Iterator.Element?]] {
        guard let maxRowSize = max(isOrderedBefore: { $0.count < $1.count })?.count else { return [] }
        
        var result: [[Iterator.Element.Iterator.Element?]] = []
        result.reserveCapacity(maxRowSize)
        
        var currentColumnIndex = 0
        while currentColumnIndex < maxRowSize {
            var transposed: [Iterator.Element.Iterator.Element?] = []
            transposed.reserveCapacity(count)
            
            transposed.append(contentsOf: indices.map { index -> Iterator.Element.Iterator.Element? in
                if currentColumnIndex < self[index].count {
                    return self[index][currentColumnIndex]
                }
                else {
                    return nil
                }
            })
            
            result.append(transposed)
            currentColumnIndex += 1
        }
        
        return result
    }
}

//: Credit to [@brentdax](https://twitter.com/brentdax)
extension Collection where Index: Comparable {
    subscript(safe index: Index) -> Iterator.Element? {
        guard index >= startIndex && index < endIndex else {
            return nil
        }
        
        return self[index]
    }
}

//: Credit to [@UINT_MIN](https://twitter.com/UINT_MIN)
extension Collection where Iterator.Element: Comparable, Indices.Iterator.Element == Index {
    var maxIndex: Index? {
        return indices.max(isOrderedBefore:) {
            self[$0] < self[$1]
        }
    }
}

//: Credit to [@oisdk](https://twitter.com/oisdk)
extension Collection where Index: Comparable, Indices.Iterator.Element == Index {
    func lastIndexOf(isElement: @noescape (Iterator.Element) -> Bool) -> Index? {
        for index in indices.reversed() where isElement(self[index]) {
            return index
        }
        
        return nil
    }
}

//: Credit to [@airspeedswift](https://twitter.com/airspeedswift)
extension Collection
    where
    Iterator.Element: Equatable,
    Index: Strideable,
    IndexDistance == Index.Stride,
    SubSequence.Iterator.Element == Iterator.Element {
    
    func search<
        Other: Collection
        where
            Other.Iterator.Element == Iterator.Element,
            Other.IndexDistance == Self.IndexDistance
        >(pat: Other) -> Index? {
        
        guard !isEmpty && pat.count <= count else { return nil }
        
        for i in startIndex...endIndex.advanced(by: -pat.count) {
            if self.suffix(from: i).starts(with: pat, isEquivalent: ==) {
                return i
            }
        }
        
        return nil
    }
}
