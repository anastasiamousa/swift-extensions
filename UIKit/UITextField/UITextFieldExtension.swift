import UIKit

extension UITextField {
    
    func addErrorView(errorImageSize: Int = 22, padding: Int = 22) {
        
        let imageView = UIImageView(frame: CGRect(x: padding/2, y: padding/2, width: errorImageSize, height: errorImageSize))
        imageView.image = UIImage(systemName: "exclamationmark.triangle")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .red
        
        let rightView = UIView(frame: CGRect( x: 0, y: 0, width: errorImageSize + padding, height: errorImageSize + padding))
        rightView.addSubview(imageView)
        
        self.rightViewMode = .always
        self.rightView = rightView
    }
    
    func withAttributedText(attributedProperties: [AttributedProperty], alignment: NSTextAlignment = .center, lineHeight: CGFloat = 0, lineSpacing: CGFloat = 0, underlineStyle: NSUnderlineStyle? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.lineBreakMode = .byWordWrapping
        let combinedAttributedText = NSMutableAttributedString()
        for attributedProperty in attributedProperties {
            let titleAttributedString = NSMutableAttributedString(string: attributedProperty.text)
            titleAttributedString.addAttributes([NSAttributedString.Key.font: attributedProperty.font,
                                                 NSAttributedString.Key.foregroundColor: attributedProperty.textColor,
                                                 NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                 NSAttributedString.Key.strokeWidth: attributedProperty.strokeProperty.stroke,
                                                 NSAttributedString.Key.strokeColor: attributedProperty.strokeProperty.strokeColor],
                                                range: NSRange(location: 0, length: titleAttributedString.length))
            
            if let underlineStyle = attributedProperty.underlineStyle {
                titleAttributedString.addAttributes([NSAttributedString.Key.underlineStyle: underlineStyle.rawValue],
                                                    range: NSRange(location: 0, length: titleAttributedString.length))
            }
            
            combinedAttributedText.append(titleAttributedString)
        }
        
        if let underlineStyle = underlineStyle {
            combinedAttributedText.addAttributes([NSAttributedString.Key.underlineStyle: underlineStyle.rawValue], range: NSRange(location: 0, length: combinedAttributedText.length))
        }

        self.attributedText = combinedAttributedText
    }
    
}
