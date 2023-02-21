//
//  FetchMovieListUseCaseContract.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine
protocol FetchMovieListUseCaseContract {
    func execute(
        with pageIndex: Int,
        and limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError>
}

