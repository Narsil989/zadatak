//
//  PostDetailsViewController.swift
//  Zadatak
//
//  Created by dejan kraguljac on 12/03/2020.
//

import UIKit

class PostDetailsViewController: MVVMViewController<PostDetailsVM> {
    
    var postId: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "posts_details_main_title".localizedUppercase
    }
    
    override func bindInput() -> PostDetailsVM.Input {
        return PostDetailsVM.Input(postId: .just(postId))
    }
    
    override func bindOuput(_ output: PostDetailsVM.Output) {
        
    }
}
