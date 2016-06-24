//: [Table of Contents](Table%20of%20Contents)

import UIKit

//: Credit to [@soffes](https://twitter.com/soffes)
extension UISplitViewController {
    convenience init(masterViewController: UIViewController, detailViewController: UIViewController) {
        self.init()
        viewControllers = [masterViewController, detailViewController]
    }
    
    var masterViewController: UIViewController? {
        return viewControllers.first
    }
    
    var detailViewController: UIViewController? {
        guard viewControllers.count == 2 else { return nil }
        return viewControllers.last
    }
}

