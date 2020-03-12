//
//  PostListVM.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import RxCocoa

class PostListVM: ViewModelType {
    
    var postsService: PostService!
    
    struct Input {
        var didSelect: Driver<IndexPath>
    }
    struct Output {
        var posts: Driver<[Post]>
        var openDetails: Driver<Scene>
    }
    
    func transform(input: PostListVM.Input) -> PostListVM.Output {
        
        let posts = postsService.getPosts()
            .asDriver(onErrorJustReturn: [])
        let openDetails = Driver.combineLatest(input.didSelect, posts).map { Scene.postDetails($0.1[$0.0.row].id) }
        return PostListVM.Output(posts: posts, openDetails: openDetails)
    }
    
}
