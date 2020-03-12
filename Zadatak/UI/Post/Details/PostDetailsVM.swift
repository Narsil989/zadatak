//
//  PostDetailsVM.swift
//  Zadatak
//
//  Created by dejan kraguljac on 12/03/2020.
//

import RxCocoa

class PostDetailsVM: ViewModelType {
    
    var postsService: PostService!
    
    struct Input {
        var postId: Driver<Int>
    }
    struct Output {
        var post: Driver<Post?>
    }
    
    func transform(input: PostDetailsVM.Input) -> PostDetailsVM.Output {
        
        let posts = input.postId.asObservable().takeLast(1).flatMapLatest(postsService.getPost(_:)).asDriver(onErrorJustReturn: nil)
        return PostDetailsVM.Output(post: posts)
    }
    
}

