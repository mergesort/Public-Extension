//: [Table of Contents](Table%20of%20Contents)

func +<U, V>(var lhs: [U: V], rhs: [U: V]) -> [U: V] {
    for (key, value) in rhs {
        lhs[key] = value
    }

    return lhs
}

extension Dictionary {
    func map<T>(@noescape transform: Value -> T) -> [Key: T] {
        return reduce([:]) {
            $0 + [$1.0: transform($1.1)]
        }
    }
}