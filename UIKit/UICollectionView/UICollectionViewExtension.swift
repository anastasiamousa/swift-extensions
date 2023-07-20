import UIKit

extension UICollectionView {

    //dequeue reusable cell
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Collection View Cell")
        }
        return cell
    }

    // bind cell
    func bindCell(named: String) {
        let nib = UINib(nibName: named, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: named+"Identifier")
    }

    //bind header
    func bindHeader(named: String) {
        let nib = UINib(nibName: named, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: named+"Identifier")
    }

    private func addBackgroundView(text: String, font: UIFont = UIFont.getFont(fontTypeEnum: .medium, size: 16), textColor: UIColor = .black, backgroundColor: UIColor = .clear) {
        let emptyView = EmptyView.fromNib()
        emptyView.alpha = 0
        emptyView.frame = self.bounds
        emptyView.setUpMessageLabel(text: text, font: font, textColor: textColor, backgroundColor: backgroundColor)
        self.backgroundView = emptyView
        UIView.animate(withDuration: 1, animations: {
            emptyView.alpha = 1
        })
    }
    
    private func resetBackgroundView() {
        let view = UIView()
        view.alpha = 0
        self.backgroundView = view
        UIView.animate(withDuration: 1, animations: {
            view.alpha = 1
        })
    }
    
}
