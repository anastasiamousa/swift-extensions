//
//  HtmlToAttributedStringExtension.swift
//  - Project name -
//
//  Created by Anastasia Mousa on 8/2/23.
//

import UIKit

extension NSMutableAttributedString {
    func setFontFace() {
        let mainFont = UIFont.dinGreek(with: .regular, size: 16)
        beginEditing()
        self.enumerateAttribute(.font, in: NSRange(location: 0, length: self.length)) { (value, range, _) in
            
            if let font = value as? UIFont {
                if let newFontDescriptor = font.fontDescriptor.withFamily(mainFont.familyName).withSymbolicTraits(font.fontDescriptor.symbolicTraits) {
                    
                    let newFont = UIFont(descriptor: newFontDescriptor, size: mainFont.pointSize)
                    removeAttribute(.font, range: range)
                    addAttribute(.font, value: newFont, range: range)
                } else {
                    let traits = font.fontDescriptor.symbolicTraits
                    if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitBold.rawValue) != 0 {
                        let newFont = UIFont.dinGreek(with: .medium, size: 16)
                        removeAttribute(.font, range: range)
                        addAttribute(.font, value: newFont, range: range)
                    }
                    if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitItalic.rawValue) != 0 {
                        let newFont = UIFont.dinGreek(with: .regular, size: 16)
                        removeAttribute(.font, range: range)
                        addAttribute(.font, value: newFont, range: range)
                    }
                }
            }
        }
        endEditing()
    }
}

