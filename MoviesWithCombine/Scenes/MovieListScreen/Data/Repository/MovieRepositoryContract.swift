//
//  MovieRepositoryContract.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine
protocol MoviesListRepositoryContract {
    func fetchMoviesList(
        using pageIndex: Int,limitPages:Int
    ) -> AnyPublisher<[MoviesListResonse], BaseError>
}
