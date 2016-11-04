import UIKit

extension String {

    func titleStyle() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: NSAttributedString(string: self).titleAttributes)
    }
    
    func bodyStyle() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: NSAttributedString(string: self).bodyAttributes)
    }
}
