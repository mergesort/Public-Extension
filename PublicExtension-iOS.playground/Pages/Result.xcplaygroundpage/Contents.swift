//: [Table of Contents](Table%20of%20Contents)

enum Result<T, Error: ErrorType> {
    case Success(T)
    case Failure(Error)
    
    // See full implementation at https://github.com/antitypical/Result
}

extension Result {
    func dematerialize() throws -> T {
        switch self {
        case let .Success(value):
            return value
        case let .Failure(error):
            throw error
        }
    }
}
