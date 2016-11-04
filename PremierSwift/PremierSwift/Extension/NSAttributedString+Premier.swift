import UIKit

extension NSAttributedString {
    
    var titleAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1), NSForegroundColorAttributeName: UIColor.darkGray]
    }
    
    var bodyAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body), NSForegroundColorAttributeName: UIColor.gray]
    }
}

