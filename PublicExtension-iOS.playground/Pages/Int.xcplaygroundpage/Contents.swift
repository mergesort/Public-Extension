//: [Table of Contents](Table%20of%20Contents)

extension Int {
    func repeatClosure(closure: () -> Void) {
        (0..<self).forEach { _ in
            closure()
        }
    }
}