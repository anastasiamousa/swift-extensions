import Foundation

extension String {
    
    func getAttributedStringFromHTML() -> NSAttributedString? {
        let data = Data(self.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) {
            let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
            mutableAttributedString.setFontFace()
            return mutableAttributedString.attributedSubstring(from: NSRange(location: 0, length: mutableAttributedString.length))
        }
        return nil
    }
}
