//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [Nate Cook](https://twitter.com/nnnnnnnn)
extension Timer {
    class func schedule(delay: TimeInterval, handler: (@escaping (CFRunLoopTimer?) -> Void)) -> Timer? {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)

        return timer
    }

    class func schedule(repeatInterval interval: TimeInterval, handler: (@escaping (CFRunLoopTimer?) -> Void)) -> Timer? {
        let fireDate = interval + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)

        return timer
    }
}
