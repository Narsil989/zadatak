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
    case postDetails(_ id: Int)
}

extension Scene {
    var viewController: UIViewController {
        switch self {
        case .tabbar:
            let controller = FactoryContainer.instance.resolve(TabbarViewController.self)!
            return UINavigationController(rootViewController: controller)
        case .posts:
            let controller = FactoryContainer.instance.resolve(PostListViewController.self)!
            return controller
        case let .postDetails(id):
            let controller = FactoryContainer.instance.resolve(PostDetailsViewController.self)!
            controller.postId = id
            return controller
            
        }
    }
}
