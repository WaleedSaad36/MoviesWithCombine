//
//  MovieListRepository.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine

final class MovieListRepository:DisposeObject{
    //MARK:- Private Properties
    private let movieService:MovieListServiceContract
    
    //MARK:- initializar
    init(movieService: MovieListServiceContract = MovieService()) {
        self.movieService = movieService
    }
}
extension MovieListRepository:MovieListServiceContract{
    func fetchMoviesList(using pageIndex: Int, limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError> {
        
        let remoteData = movieService.fetchMoviesList(using: pageIndex, limitPages: limitPages).eraseToBaseError().eraseToAnyPublisher()
        
        return remoteData
    }
}


