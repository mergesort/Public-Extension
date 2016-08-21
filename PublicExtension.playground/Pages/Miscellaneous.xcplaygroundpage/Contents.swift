//: [Table of Contents](Table%20of%20Contents)

import UIKit

func apply<T, U>(_ transform: @escaping (inout T) -> (U) -> Void) -> (T) -> (U) -> T {
    return { a in
        { b in
            var c = a
            transform(&c)(b)
            return c
        }
    }
}

protocol SomeProtocol {
    associatedtype Container: Sequence
}

extension SomeProtocol {
    typealias Element = Container.Iterator.Element
}

func fatalError<T: CustomStringConvertible & Error>(error: T) {
    fatalError(error.description)
}

//: Credit to [@sandofsky](https://twitter.com/sandofsky)
protocol StoryboardBacked: class {
    static func newFromStoryboardWithName(name: String?, bundle: Bundle?) -> Self
}

extension StoryboardBacked {
    static func newFromStoryboardWithName(name: String? = nil, bundle: Bundle? = nil) -> Self {
        guard
            let controller = UIStoryboard(name: name ?? String(describing: Self.self), bundle: bundle).instantiateInitialViewController() as? Self
            else {
                fatalError("Misconfigured storyboard!")
        }
        
        return controller
    }
}
