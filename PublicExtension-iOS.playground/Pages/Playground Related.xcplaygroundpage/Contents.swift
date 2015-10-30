//: [Table of Contents](Table%20of%20Contents)

// Sample struct

struct Website {
    let url: String
}

extension Website: CustomPlaygroundQuickLookable {
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return .URL(url)
    }
}