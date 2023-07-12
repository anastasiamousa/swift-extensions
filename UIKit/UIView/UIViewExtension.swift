import UIKit

extension UIView {

    // round corners
    func roundCorners() {
        layer.cornerRadius  = bounds.size.height / 2
        layer.masksToBounds = true
    }

    // round corners with parameter
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius  = radius
        layer.masksToBounds = true
    }

    // set enabled
    func setEnabled(_ enable: Bool) {
        isUserInteractionEnabled = enable
        alpha = enable ? 1.0 : 0.5
    }

    
    // MARK: - initialize view inside class connected to xib
    //  @IBOutlet var view: UIView!
    //  view = self.getViewFromNib(named: "PasswordInformationView")
    
    func getViewFromNib(named name: String) -> UIView {
        guard let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?[0] as? UIView else { return UIView() }
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.addSubview(view)
        return view
    }

    
    // MARK: - initialize view class with xib programmatically
    // let view = CustomClassView.fromNib()
    
    class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    
    private class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }
    
    private class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    private class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    
    // MARK: - add subview in parent adding constraints
    
    func addAndExpand(at parentView: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0).isActive = true
    }
    
    // MARK: - round corners for a view.
    func round(cornerRadious: CGFloat? = nil) {
        self.layer.cornerRadius = cornerRadious ?? self.layer.bounds.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }

    func mask(withBazierPaths bazierPaths: [UIBezierPath], inverse: Bool = false) {
        
        let path: UIBezierPath = UIBezierPath()

        for bazierPath in bazierPaths {
            path.append(bazierPath)
        }
        
        let maskLayer = CAShapeLayer()
        
        if inverse {
            path.append(UIBezierPath(rect: self.bounds))
            maskLayer.fillRule = .evenOdd
        }
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer  
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addTopBorderWithColor(inset: CGFloat, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: inset, y: 0, width: UIScreen.main.bounds.width - (inset * 2), height: width)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.bounds.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addGreenGradientLayer() {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red: 0.51, green: 0.71, blue: 0.23, alpha: 1.00).cgColor,
                           UIColor(red: 0.21, green: 0.47, blue: 0.16, alpha: 1.00).cgColor,
                           UIColor(red: 0.00, green: 0.28, blue: 0.07, alpha: 1.00).cgColor]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = self.bounds
        
        self.layer.insertSublayer(gradient, at: 0)
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func addGrayGradientLayer() {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.clear.cgColor,
                           UIColor.App.lightGrayBackgroundColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = self.bounds
        
        self.layer.insertSublayer(gradient, at: 0)
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func removeGradientLayer() {
        guard let layers = self.layer.sublayers else { return }
        for layer in layers where layer is CAGradientLayer {
            layer.removeFromSuperlayer()
        }
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale  = scale ? UIScreen.main.scale : 1
      }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
    }
    
    func removeSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}
