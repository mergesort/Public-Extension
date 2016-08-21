//: [Table of Contents](Table%20of%20Contents)

import UIKit
import Foundation

//: Credit to [@devxoul](https://github.com/devxoul)
protocol Then {}
extension NSObject: Then {}

extension Then {
    func then(block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
