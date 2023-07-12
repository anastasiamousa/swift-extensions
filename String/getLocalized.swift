import UIKit

extension String {
    
    func getLocalized() -> String {
        guard let bundle = appViewModel.localizationManager.bundle else {
            return NSLocalizedString(self, comment: "")
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }

}
