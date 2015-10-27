//: [Table of Contents](Table%20of%20Contents)

import Foundation

// MARK: - Repeat block

extension Int {
    func repeatClosure(closure: () -> Void) {
        (0..<self).forEach { _ in
            closure()
        }
    }
}

// MARK: - Random `Int` in specific bounds

//: From the QuickCheck chapter in [Functional Programming in Swift](https://www.objc.io/books/fpinswift/)!

extension Int {
    static func random(from from: Int, to: Int) -> Int {
        return from + Int(arc4random_uniform(UInt32(to - from)))
    }
}