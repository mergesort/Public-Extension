//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension NSUserDefaults {
    func setValue(value: AnyObject?, forKey key: String, synchronize shouldSynchronize: Bool) -> Bool? {
        setValue(value, forKey: key)
        
        return shouldSynchronize ? synchronize() : nil
    }
    
    // Repeat for other setters
}
