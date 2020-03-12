//
//  UIViewController+Ext.swift
//  Zadatak
//
//  Created by dejan kraguljac on 12/03/2020.
//

import UIKit

extension UIViewController {
    
    func actualViewController() -> UIViewController {
        if let navigationViewController = self as? UINavigationController {
            return navigationViewController.viewControllers.first!
        }
        return self
    }
    
}
