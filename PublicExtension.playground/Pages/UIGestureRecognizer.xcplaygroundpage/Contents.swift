//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIGestureRecognizer {
    func requireGestureRecognizersToFail(recognizers: [UIGestureRecognizer]) {
        recognizers.forEach(require)
    }
}

//: Credit to [@bukovinski](https://twitter.com/bukovinski)
extension UIGestureRecognizer {
    func cancel() {
        isEnabled = false
        isEnabled = true
    }
}
