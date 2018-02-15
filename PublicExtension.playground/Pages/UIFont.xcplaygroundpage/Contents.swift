//: [Table of Contents](Table%20of%20Contents)

import UIKit

//: Credit to [@soffes](https://twitter.com/soffes)
extension UIFont {
    var fontWithMonospaceNumbers: UIFont {
        let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
			UIFontDescriptor.AttributeName.featureSettings: [
                [
					UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
					UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
                ]
            ]
        ])
        
        return UIFont(descriptor: fontDescriptor, size: pointSize)
    }
}
