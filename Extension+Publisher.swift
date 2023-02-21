//
//  Extension+Publisher.swift
//  MarvelTask
//
//  Created by Waleed Saad on 18/02/2023.
//

import Combine
import Foundation
extension Publisher {
    /// Use this func to map error to the `BaseError`
    /// - Returns: `Publishers.MapError<Self, BaseError>`
//    func eraseToBaseError() -> Publishers.MapError<Self, BaseError> {
//        return self.mapError { (error: Self.Failure) -> BaseError in
//                guard let baseError = error as? BaseError else {
//                    return ErrorResolver.shared.getError(for: .unexpected)
//                }
//                return baseError
//            }
//    }
}

