//: [Table of Contents](Table%20of%20Contents)

import UIKit

// Shared protocol to represent reusable items, e.g. table or collection view cells
protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension UITableView {
    // Allowing UITableView class registration with Reusable
    func registerReusableClass(cellClass: Reusable.Type) {
        registerClass(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
}