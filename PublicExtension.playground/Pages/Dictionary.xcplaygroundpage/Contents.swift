//: [Table of Contents](Table%20of%20Contents)

func +<U, V>(lhs: [U: V], rhs: [U: V]) -> [U: V] {
    var lhs = lhs
    for (key, value) in rhs {
        lhs[key] = value
    }
    
    return lhs
}

extension Dictionary {
    func map<T>(transform: (Value) -> T) -> [Key: T] {
        return reduce([:]) {
            $0 + [$1.0: transform($1.1)]
        }
    }
    
    func groupBy<T>(groupBy: (Key, Value) -> T) -> [T: [Value]] {
        var result: [T: [Value]] = [:]
        
        forEach {
            let groupKey = groupBy($0, $1)
            result[groupKey] = (result[groupKey] ?? []) + [$1]
        }
        
        return result
    }
}
