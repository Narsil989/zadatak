//
//  PostService.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//
import RxSwift

protocol PostService {
    func getPosts() -> Single<[Post]>
    func getPost(_ id: Int) -> Single<Post?>
}

class PostServiceImpl: NetworkService, PostService {
    func getPosts() -> Single<[Post]> {
        let request: Single<NetworkResult<[Post]>> = apiRequest(.posts)
        return request.map { result -> [Post] in
            switch result {
            case let .success(posts):
                return posts
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return []
            }
        }
    }
    
    func getPost(_ id: Int) -> Single<Post?> {
        let request: Single<NetworkResult<Post?>> = apiRequest(.post(id: id))
        return request.map { result -> Post? in
            switch result {
            case let .success(post):
                return post
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }
        }
    }
}

struct Post: Decodable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}
