//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension NSUserDefaults {
    // See note on why this should be used sparingly: https://twitter.com/PublicExtension/status/685562312724492290
    func setValue(value: AnyObject?, forKey key: String, synchronize shouldSynchronize: Bool) -> Bool? {
        setValue(value, forKey: key)
        
        return shouldSynchronize ? synchronize() : nil
    }
    
    // Repeat for other setters
}

extension NSUserDefaults {
    subscript(key: String) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        
        set {
            setObject(newValue, forKey: key)
        }
    }
    
    // For a generalization of this, see https://github.com/radex/SwiftyUserDefaults
}
