//: [Table of Contents](Table%20of%20Contents)

extension Array {
    subscript(safe index: Index) -> Element? {
        return index < endIndex ? self[index] : nil
    }
}