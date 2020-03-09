//
//  Injectable.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import Swinject

final class SingletoneContainer {
    
    static let instance: Container = {
        let container = Container(defaultObjectScope: .container)
        return SingletoneContainer.build(container: container)
    }()
    
    static func build(container: Container) -> Container {
        
        return container
    }
}

final class FactoryContainer {
    
    static let instance: Container = {
        let container = Container(parent: SingletoneContainer.instance, defaultObjectScope: .transient)
        return FactoryContainer.build(container)
    }()
    
    static func build(_ container: Container) -> Container {
        
        container.register(TabbarVM.self) { resolver in
            let instance = TabbarVM()
            return instance
        }
        return container
    }
    
}
