//
//  MovieStorageManagerContract.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine
protocol MoviesStorageContract {
    func fetchAll() -> AnyPublisher<[MoviesListResonse],BaseError>
    func saveAll(_ movies: [MoviesListResonse])
    func save(_ movieData: MoviesListResonse)
    func deleteAll()
}
