//: [Table of Contents](Table%20of%20Contents)

import UIKit

// MARK: - UIImage Resources Example

extension UIImage {
    // Good practice to prefix the names of your static members on UIKit extensions
    class var jas_corgi: UIImage {
        return UIImage(named: "corgi.jpg")!
    }
}