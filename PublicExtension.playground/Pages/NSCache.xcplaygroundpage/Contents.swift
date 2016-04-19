//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@soffes](https://twitter.com/soffes)
extension NSCache {
    subscript(key: AnyObject) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        
        set(object) {
            if let object = object {
                setObject(object, forKey: key)
            } else {
                removeObjectForKey(key)
            }
        }
    }
}
