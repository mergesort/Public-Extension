//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIViewController {

    func add(childViewController: UIViewController) {
        self.addChildViewController(childViewController)
        self.view.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }

    func insert(childViewController: UIViewController, belowSubview subview: UIView) {
        self.addChildViewController(childViewController)
        self.view.insertSubview(childViewController.view, belowSubview: subview)
        childViewController.didMove(toParentViewController: self)
    }

    func insert(childViewController: UIViewController, aboveSubview subview: UIView) {
        self.addChildViewController(childViewController)
        self.view.insertSubview(childViewController.view, aboveSubview: subview)
        childViewController.didMove(toParentViewController: self)
    }

    func insert(childViewController: UIViewController, at index: Int) {
        self.addChildViewController(childViewController)
        self.view.insertSubview(childViewController.view, at: index)
        childViewController.didMove(toParentViewController: self)
    }

    func removeFromParent() {
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}
