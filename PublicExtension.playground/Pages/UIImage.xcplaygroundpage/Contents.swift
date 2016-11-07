//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIImage {
    class var jas_corgi: UIImage {
        return UIImage(named: "corgi.jpg")!
    }
}

//: Credit to [@mergesort](https://twitter.com/mergesort) and [@khanlou](https://twitter.com/khanlou)
extension UIImage {
    static func image(from color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image {
            $0.cgContext.setFillColor(color.cgColor)
            $0.cgContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
