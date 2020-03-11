//
//  PostService.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//
import RxSwift

protocol PostService {
    func getPosts() -> Single<[Post]>
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
}

struct Post: Decodable {
    let title: String
}
