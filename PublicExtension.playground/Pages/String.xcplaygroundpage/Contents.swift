//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension String {
    init<T>(stringInterpolationSegment expr: T?) {
        if let expr = expr {
            self = "\(expr)?"
        }
        else {
            self = "None"
        }
    }
}

extension String {
    func parseDate(format: String = "yyyy-MM-dd") -> Date? {
        // NSDateFormatter initialization is expensive, a shared formatter should be used for common formattings
        let formatter = DateFormatter()

        formatter.timeZone = .current
        formatter.dateFormat = format

        return formatter.date(from: self)
    }
}

extension String {
    func computeReadingTime(readingSpeed: Double = 250) -> Double {
        let words = components(separatedBy: CharacterSet.whitespaces).filter { !$0.isEmpty }
        return Double(words.count) / readingSpeed
    }
}

//: Credit to [@ericasadun](https://twitter.com/ericasadun)
extension String {
    // Force String to NSString
    var ns: NSString {
        return self as NSString
    }
}

extension NSString {
    // Force NSString to String
    var swift: String {
        return self as String
    }
}

extension String {
    var trimmedString: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    var reversedString: String {
        return String(characters.reversed())
    }
}

//: Credit to [@ndis1](https://github.com/ndis1)
extension String {
    private var qrImage: CIImage? {
        let textData = data(using: .isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(textData, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        
        return filter?.outputImage
    }
    
    func qrImage(withSize size: CGSize,
                 foregroundColor: UIColor = .black,
                 backgroundColor: UIColor = .white) -> UIImage? {
        
        return qrImage?.scaledWithSize(size)
                    .colored(withForegroundColor: foregroundColor,
                             backgroundColor: backgroundColor)?.uiImage
    }
}

private extension CIImage {
    var uiImage: UIImage? {
        return UIImage(ciImage: self)
    }
    
    func scaledWithSize(_ size: CGSize) -> CIImage {
        let scaleX = size.width / extent.size.width
        let scaleY = size.height / extent.size.height
        
        return applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
    }
    
    func colored(withForegroundColor foregroundColor: UIColor, backgroundColor: UIColor) -> CIImage? {
        let foregroundCoreColor = CIColor(uiColor: foregroundColor)
        let backgroundCoreColor = CIColor(uiColor: backgroundColor)
        
        let colorFilter = CIFilter(name: "CIFalseColor", withInputParameters: [
            "inputImage": self,
            "inputColor0":foregroundCoreColor,
            "inputColor1":backgroundCoreColor
        ])
        
        return colorFilter?.outputImage
    }
}

private extension CIColor {
    convenience init(uiColor: UIColor) {
        let foregroundColorRef = uiColor.cgColor
        let foregroundColorString = CIColor(cgColor: foregroundColorRef).stringRepresentation
        
        self.init(string: foregroundColorString)
    }
}

extension String {
    var initials: String {
        return components(separatedBy: .whitespaces)
            .flatMap { $0.characters.first }
            .map { String.init($0).uppercased() }
            .joined(separator: "")
    }
}

//: Credit to [@olebegemann](https://twitter.com/olebegemann)
extension String {
    func wrapped(after: Int = 70) -> String {
        var i = 0
        
        return characters.split(omittingEmptySubsequences: false) { character in
            switch character {
            case "\n",
                 " " where i >= after:
                i = 0
                return true
            default:
                i += 1
                return false
            }
        }.map(String.init)
        .joined(separator: "\n")
    }
}

//: Credit to [@terhechte](https://twitter.com/terhechte)
extension String {
    /// - Complexity: Θ(*n*), where *n* is the number of Unicode scalars backing `self`
    subscript(start: UInt, length: UInt) -> String? {
        guard
            let start = index(startIndex, offsetBy: Int(start), limitedBy: endIndex),
            let end = index(start, offsetBy: Int(length), limitedBy: endIndex)
        else { return nil }
        
        return substring(with: start..<end)
    }
}

//: Credit to [@ayanonagon](https://twitter.com/ayanonagon)
extension String {
    /// - Complexity: Θ(*n*), where *n* is the number of Unicode scalars backing `self`
    /// - Note: This implementation strips out everything but alphanumerics, but can be modified for your desired behavior!
    var s_n_a_k_e_c_a_s_e_d: String { // 😝
        var charactersToRemove = CharacterSet.alphanumerics.inverted
        charactersToRemove.remove(charactersIn: " ")

        let result = components(separatedBy: charactersToRemove).joined(separator: "")
        return result.replacingOccurrences(of: " ", with: "_").lowercased()
    }
}
