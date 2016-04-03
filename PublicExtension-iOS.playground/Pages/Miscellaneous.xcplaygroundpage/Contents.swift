//: [Previous](@previous)

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
