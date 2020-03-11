//
//  ApiEndpoint.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import Moya

enum ApiEndpoint {
    case posts
}

extension ApiEndpoint: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: ApiConfig.baseUrl)!
        }
    }
    
    var path: String {
        switch self {
        case .posts:
            return "api/posts"
        }
    }
    
    var method: Method {
        switch self {
        case .posts:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["X-Auth" : ApiConfig.accessToken, "Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .none
    }
    
    var task: Task {
        switch self {
        case .posts:
            return .requestPlain
        }
    }
}
