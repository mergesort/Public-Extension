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