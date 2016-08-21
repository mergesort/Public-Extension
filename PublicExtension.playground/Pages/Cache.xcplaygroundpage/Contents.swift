//: [Table of Contents](Table%20of%20Contents)

import Foundation

// The Swift 3.0 compiler bundled w/ Xcode 8 Beta 3 currently segfaults on this extension. Hopefully this is fixed soon!
//: Credit to [@soffes](https://twitter.com/soffes)
extension NSCache {
    subscript(key: KeyType) -> ObjectType? {
        get {
            return object(forKey: key)
        }
        
        set(object) {
            if let object = object {
                setObject(object, forKey: key)
            }
            else {
                removeObject(forKey: key)
            }
        }
    }
}
