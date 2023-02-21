//
//  ApiServiceContract.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine

protocol APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder,
        retry: Int
    ) -> AnyPublisher<T, BaseError>
}

extension APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type
    ) -> AnyPublisher<T, BaseError> {
        self.request(
            using: request,
            responseType: responseType,
            decoder: JSONDecoder(),
            retry: 3
        )
    }
}
