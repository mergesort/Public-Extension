//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach(addSubview)
    }

    var frameHeight: CGFloat {
        return frame.height
    }

    var frameWidth: CGFloat {
        return frame.width
    }
    
    convenience init(translatesAutoresizingMaskIntoConstraints: Bool) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}

enum ViewTag: Int {
    case None
    case TitleLabel
    case LoginButton
    
    // etc.
}

//: Credit to [@rolandleth](https://twitter.com/rolandleth)
extension UIView {
    var safeTag: ViewTag {
        get {
            return ViewTag(rawValue: tag) ?? .None
        }
        
        set {
            tag = newValue.rawValue
        }
    }
    
    func viewWithTag(tag: ViewTag) -> UIView? {
        return viewWithTag(tag.rawValue)
    }
}

extension UIView {
    var isRTL: Bool {
        return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
    }
}

//: Credit to [@JPMcGlone](https://twitter.com/JPMcGlone)
extension UIView {
    func removeAllGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }
}
