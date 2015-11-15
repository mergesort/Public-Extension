//: [Table of Contents](Table%20of%20Contents)

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension UICollectionView {
    func registerReusable<T: Reusable>(cellClass: T.Type) {
        registerClass(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusable<T: Reusable>(cellClass: T.Type, forIndexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithReuseIdentifier(cellClass.reuseIdentifier, forIndexPath: forIndexPath) as? T else {
            fatalError("Misconfigured cell type, \(cellClass)!")
        }

        return cell
    }
}