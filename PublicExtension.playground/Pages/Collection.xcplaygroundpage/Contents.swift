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
        guard let maxRowSize = self.max(by: { $0.count < $1.count })?.count else { return [] }
        
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
        do {
            try indices.max(by:) {
                self[$0] < self[$1]
            }
        }
        catch {}
        
        return nil
    }
}

//: Credit to [@oisdk](https://twitter.com/oisdk)
extension Collection where Index: Comparable, Indices.Iterator.Element == Index {
    func lastIndexOf(isElement: (Iterator.Element) -> Bool) -> Index? {
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
    
    func search<Other: Collection>(pat: Other) -> Index?
        where
            Other.Iterator.Element == Iterator.Element,
            Other.IndexDistance == Self.IndexDistance {
                
        guard !isEmpty && pat.count <= count else { return nil }
        
        for i in startIndex...endIndex.advanced(by: -pat.count) {
            if self.suffix(from: i).starts(with: pat) {
                return i
            }
        }
        
        return nil
    }
}

//: Credit to [@ericasadun](https://twitter.com/ericasadun)
extension Collection where Iterator.Element: Comparable, Index: Integer {
    func element(after element: Iterator.Element) -> Iterator.Element? {
        guard let
            idx = index(of: element),
            index(idx, offsetBy: 1) < endIndex
        else { return nil }
        
        return self[idx + 1]
    }
    
    func element(before element: Iterator.Element) -> Iterator.Element? {
        guard let
            idx = index(of: element),
            index(idx, offsetBy: -1) >= startIndex
        else { return nil }
        
        return self[idx - 1]
    }
}

//: Credit to [@aciidb0mb3r](https://twitter.com/aciidb0mb3r)
extension Collection {

    /// Creates a partition of `self`, represented by a tuple of arrays where members of the first component
    /// matches `predicate` and the second contains elements that do not.
    ///
    /// - Parameter predicate: The condition on which to partition `self
    /// - Returns: Tuple representing the split. The first component contains matches and the second
    ///            contains nonmatches.
    func partition(_ predicate: (Iterator.Element) -> Bool) -> ([Iterator.Element], [Iterator.Element]) {
        var matching: [Iterator.Element] = []
        var nonMatching: [Iterator.Element] = []

        forEach {
            if predicate($0) {
                matching.append($0)
            }
            else {
                nonMatching.append($0)
            }
        }
        
        return (matching, nonMatching)
    }
}
