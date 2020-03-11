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
    }
    struct Output {
        var posts: Driver<[Post]>
    }
    
    func transform(input: PostListVM.Input) -> PostListVM.Output {
        
        let posts = postsService.getPosts()
            .asDriver(onErrorJustReturn: [])
        return PostListVM.Output(posts: posts)
    }
    
}
