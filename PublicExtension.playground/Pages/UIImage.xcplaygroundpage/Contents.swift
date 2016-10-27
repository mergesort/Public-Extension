//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIImage {
    class var jas_corgi: UIImage {
        return UIImage(named: "corgi.jpg")!
    }
}

//: Credit to [@mergesort](https://twitter.com/mergesort)
extension UIImage {
    static func image(fromColor color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.height, height: size.height)
        
        UIGraphicsBeginImageContext(rect.size)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
