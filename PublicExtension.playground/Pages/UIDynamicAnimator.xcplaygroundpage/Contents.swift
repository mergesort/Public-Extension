//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIDynamicAnimator {
    func addBehaviors(behaviors: [UIDynamicBehavior]) {
        behaviors.forEach(addBehavior)
    }
}