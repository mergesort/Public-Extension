//: [Table of Contents](Table%20of%20Contents)

// Example error scenario
enum APIError: Error {
    case JSONParseFailed
    case MissingKey(String)

    // etc.
}

extension APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .JSONParseFailed:
            return "Invalid JSON!"
        case .MissingKey(let key):
            return "\(key) is missing from the JSON response!"
        }
    }
}
