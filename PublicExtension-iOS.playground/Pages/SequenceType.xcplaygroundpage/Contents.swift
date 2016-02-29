//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@khanlou](https://twitter.com/khanlou)
extension SequenceType {
    @warn_unused_result
    func any(@noescape predicate: Self.Generator.Element throws -> Bool) rethrows -> Bool {
        for element in self {
            let result = try predicate(element)
            if result {
                return true
            }
        }
        
        return false
    }
}
