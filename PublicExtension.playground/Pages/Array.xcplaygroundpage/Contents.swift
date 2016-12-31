//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension Array {
    subscript(safe index: Index) -> Element? {
        return index < endIndex && index >= startIndex ? self[index] : nil
    }

    init(withCapacity capacity: Int) {
        self.init()
        reserveCapacity(capacity)
    }
}

protocol FloatingPointType {
    var doubleValue: Double { get }
}

extension Double: FloatingPointType {
    var doubleValue: Double { return self }
}

extension Int: FloatingPointType {
    var doubleValue: Double { return Double(self) }
}

extension Float: FloatingPointType {
    var doubleValue: Double { return Double(self) }
}

extension CGFloat: FloatingPointType {
    var doubleValue: Double { return Double(self) }
}

func +(lhs: FloatingPointType, rhs: FloatingPointType) -> Double {
    return lhs.doubleValue + rhs.doubleValue
}

extension Array where Element: FloatingPointType {
    func computeAverage() -> Double? {
        guard !isEmpty else { return nil }
        return reduce(0, +) / Double(count)
    }
}

//: Credit to [@JPMcGlone](https://twitter.com/JPMcGlone)
extension Array {
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
}
