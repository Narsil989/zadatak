//
//  Network.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import Moya
import RxSwift

public typealias NetworkResult<T> = Result<T, Error>

struct EmptyResponse {
    
}

protocol NetworkProtcol {
    func request<T: Decodable>(_ target: ApiEndpoint, _ scheduler: ImmediateSchedulerType) -> Single<NetworkResult<T>>
    func getProvider() -> MoyaProvider<ApiEndpoint>
}

extension NetworkProtcol {
    func request<T: Decodable>(_ target: ApiEndpoint) -> Single<NetworkResult<T>> {
        return request(target, MainScheduler.instance)
    }
}

class Network: NetworkProtcol {
    
    var provider: MoyaProvider<ApiEndpoint>!
    
    func request<T>(_ target: ApiEndpoint, _ scheduler: ImmediateSchedulerType) -> PrimitiveSequence<SingleTrait, Result<T, Error>> where T : Decodable {
        return provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .observeOn(scheduler)
            .map(T.self, using: JSONDecoder(), failsOnEmptyData: false)
            .map { NetworkResult<T>.success($0) }.catchError { error in
                return Single.just(.failure(error))
        }
    }
    
    func getProvider() -> MoyaProvider<ApiEndpoint> {
        return provider
    }
}
