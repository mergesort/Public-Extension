//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@iosartem](http://twitter.com/iosartem)
extension Array {

    subscript(index: [Index]) -> [Element] {
        return enumerated().filter { index.contains($0.0) }.map { $0.1 }
    }
}
