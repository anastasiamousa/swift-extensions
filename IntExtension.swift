import Foundation

extension Int {

    func getOrdinal() -> String {
        let tens = (self / 10) % 10
        let ones = self % 10
        
        let suffix: String

        //adds greek suffix
        if LocalizationManager.getCurrentLanguage() == .greek { return "η" }
        
        switch (tens, ones) {
        case (1, _):
            suffix = "th"
        case (_, 1):
            suffix = "st"
        case (_, 2):
            suffix = "nd"
        case (_, 3):
            suffix = "rd"
        default:
            suffix = "th"
        }
        return "\(suffix)"
    }
}
