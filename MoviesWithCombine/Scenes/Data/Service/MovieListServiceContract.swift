//
//  MovieListServiceContract.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//


import Combine
protocol MovieListServiceContract {
    func fetchMoviesList(using pageIndex: Int, limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError>
    
}
