//
//  InstanceRegistration.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import Swinject
import Moya

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
        
        singletoneInstance.register(MoyaProvider<ApiEndpoint>.self) { resolver in
            return MoyaProvider<ApiEndpoint>()
        }
        
        singletoneInstance.register(NetworkProtcol.self) { resolver in
            let instance = Network()
            instance.provider = resolver.resolve(MoyaProvider<ApiEndpoint>.self)
            return instance
        }
        
        singletoneInstance.register(PostService.self) { resolver in
            let instance = PostServiceImpl()
            instance.network = resolver.resolve(NetworkProtcol.self)!
            return instance
        }
        
        factoryInstance.register(TabbarViewController.self) {
            let instance = TabbarViewController(coordinatorType: $0.resolve(SceneCoordinatorType.self)!, viewModel: $0.resolve(TabbarVM.self)!)
            return instance
        }
        
        factoryInstance.register(PostListViewController.self) {
            let instance = PostListViewController(viewModel: $0.resolve(PostListVM.self)!)
            return instance
        }
        
        factoryInstance.register(TabbarViewController.self) { resolver in
            TabbarViewController(coordinatorType: resolver.resolve(SceneCoordinatorType.self)!, viewModel: TabbarVM())
        }
        factoryInstance.register(PostListViewController.self) { resolver in
            PostListViewController(viewModel: resolver.resolve(PostListVM.self)!)
        }
        
        factoryInstance.register(PostListVM.self) { resolver in
            let instance = PostListVM()
            instance.postsService = resolver.resolve(PostService.self)!
            return instance
        }
    }
}
