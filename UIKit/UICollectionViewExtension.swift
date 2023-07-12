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
  
}
