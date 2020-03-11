//
//  Scene.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import UIKit

enum Scene {
    case tabbar
    case posts
}

extension Scene {
    var viewController: UIViewController {
        switch self {
        case .tabbar:
            let controller = FactoryContainer.instance.resolve(TabbarViewController.self)!
            return controller
        case .posts:
            let controller = FactoryContainer.instance.resolve(PostListViewController.self)!
            return controller
        }
    }
}
