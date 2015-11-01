//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension NSOperationQueue {
    func addOperations(operations: [NSOperation]) {
        operations.forEach(addOperation)
    }
}