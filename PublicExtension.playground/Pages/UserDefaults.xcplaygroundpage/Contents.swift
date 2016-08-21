//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension UserDefaults {
    // See note on why this should be used sparingly: https://twitter.com/PublicExtension/status/685562312724492290
    func setValue(value: AnyObject?, forKey key: String, synchronize shouldSynchronize: Bool) -> Bool? {
        setValue(value, forKey: key)
        
        return shouldSynchronize ? synchronize() : nil
    }
    
    // Repeat for other setters
}

extension UserDefaults {
    @nonobjc subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        
        set {
            set(newValue, forKey: key)
        }
    }
    
    @nonobjc subscript(key: String) -> Bool {
        get {
            return bool(forKey: key)
        }
        
        set {
            set(newValue, forKey: key)
        }
    }
    
    // etc.
}
