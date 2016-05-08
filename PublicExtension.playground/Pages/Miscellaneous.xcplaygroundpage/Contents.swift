//: [Table of Contents](Table%20of%20Contents)

import UIKit

func apply<T, U>(transform: inout T -> U -> ()) -> T -> U -> T {
    return { a in
        { b in
            var c = a
            transform(&c)(b)
            return c
        }
    }
}

protocol SomeProtocol {
    associatedtype Container: SequenceType
}

extension SomeProtocol {
    typealias Element = Container.Generator.Element
}

func fatalError<T: protocol<CustomStringConvertible, ErrorType>>(error: T) {
    fatalError(error.description)
}

//: Credit to [@sandofsky](https://twitter.com/sandofsky)
protocol StoryboardBacked: class {
    static func newFromStoryboardWithName(name: String?, bundle: NSBundle?) -> Self
}

extension StoryboardBacked {
    static func newFromStoryboardWithName(name: String? = nil, bundle: NSBundle? = nil) -> Self {
        guard
            let controller = UIStoryboard(name: name ?? String(Self), bundle: bundle).instantiateInitialViewController() as? Self
        else {
            fatalError("Misconfigured storyboard!")
        }
        
        return controller
    }
}
