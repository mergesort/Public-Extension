//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension OperationQueue {
    func addOperations(operations: [Operation]) {
        operations.forEach(addOperation)
    }
}
