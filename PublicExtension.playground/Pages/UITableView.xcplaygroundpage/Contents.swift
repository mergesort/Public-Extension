//: [Table of Contents](Table%20of%20Contents)

import UIKit

// Shared protocol to represent reusable items, e.g. table or collection view cells
protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension UITableView {
    func registerReusable<T: Reusable>(cellClass: T.Type) {
        registerClass(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusable<T: Reusable>(cellClass: T.Type) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(cellClass.reuseIdentifier) as? T else {
            fatalError("Misconfigured cell type, \(cellClass)!")
        }

        return cell
    }

    func dequeueReusable<T: Reusable>(cellClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(cellClass.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError("Misconfigured cell type, \(cellClass)!")
        }

        return cell
    }
}
