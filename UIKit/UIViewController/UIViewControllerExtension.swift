//
//  UIViewControllerExtension.swift
//  - Project name - 
//
//  Created by Anastasia Mousa on 24/1/23.
//

import UIKit

extension UIViewController {
    
    static func create(storyboardName: String, identifier: String = "") -> Self? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewControllerIdentifier = identifier == "" ? storyboardName+"ViewControllerIdentifier" : identifier
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? Self else {
            return nil
        }
        return viewController
    }
    
}
