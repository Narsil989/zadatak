//
//  NetworkService.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import RxSwift
import Moya

class NetworkService {
    var network: NetworkProtcol!
    
    func apiRequest<T: Decodable>(_ target: ApiEndpoint) -> Single<NetworkResult<T>> {
        return network.request(target)
    }
}
