//: [Table of Contents](Table%20of%20Contents)

// Sample struct
struct Website {
    let url: String
}

extension Website: CustomPlaygroundQuickLookable {
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return .url(url)
    }
}
