import UIKit

enum ButtonStyleEnum {
    
    case white
    case green
    case darkgray
    
    var titleColor: UIColor {
        switch self {
        case .white:
            return UIColor.App.darkColor
        case .green, .darkgray:
            return .white
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .white:
            return .white
        case .green:
            return UIColor.App.greenColor
        case .darkgray:
            return UIColor(hexString: "#666666")
        }
    }
    
    var borderColor: CGColor? {
        switch self {
        case .white:
            return UIColor.App.grayColor.cgColor
        case .green, .darkgray:
            return nil
        }
    }
}
    //add button style
    func addButtonStyle(title: String, buttonStyleEnum: ButtonStyleEnum) {
        self.layer.cornerRadius = 6.0
        self.setTitle(title, for: .normal)
        self.titleLabel?.numberOfLines = 0
        self.setAttributedTitle(title: title, textColor: buttonStyleEnum.titleColor)
        
        self.backgroundColor = buttonStyleEnum.backgroundColor
        switch buttonStyleEnum {
        case .white:
            self.layer.borderWidth = 1.0
            self.layer.borderColor = buttonStyleEnum.borderColor
        case .green, .darkgray:
            break
        }
      
    //with attribiuted text
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

        self.setAttributedTitle(combinedAttributedText, for: state)
    }
}
