//
//  InstanceRegistration.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import Swinject

final class InstanceRegistration {
    static var singletoneInstance: Container {
        SingletoneContainer.instance
    }
    static var factoryInstance: Container {
        FactoryContainer.instance
    }
    
    static func build() {
        singletoneInstance.register(SceneCoordinatorType.self) { _ in
            SceneCoordinator(window: UIApplication.shared.delegate!.window!!)
        }
        
        factoryInstance.register(TabbarViewController.self) { resolver in
            TabbarViewController(coordinatorType: resolver.resolve(SceneCoordinatorType.self)!, viewModel: TabbarVM())
        }
    }
}
