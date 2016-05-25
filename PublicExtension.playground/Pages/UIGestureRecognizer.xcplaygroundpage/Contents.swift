//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIGestureRecognizer {
    func requireGestureRecognizersToFail(recognizers: [UIGestureRecognizer]) {
        recognizers.forEach(requireGestureRecognizerToFail)
    }
}

//: Credit to [@bukovinski](https://twitter.com/bukovinski)
extension UIGestureRecognizer {
    func cancel() {
        enabled = false
        enabled = true
    }
}
