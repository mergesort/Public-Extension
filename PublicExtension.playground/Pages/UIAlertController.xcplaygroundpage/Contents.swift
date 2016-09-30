//: [Table of Contents](Table%20of%20Contents)

import UIKit

//: Credit to [@subdigital](https://twitter.com/subdigital)
extension UIAlertController {
    func addCancelAction() {
        addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
}
