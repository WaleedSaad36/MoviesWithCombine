//
//  MovieListUseCase.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine
final class MovieListUseCase: DisposeObject, FetchMovieListUseCaseContract{
   
    
    //MARK:- Properties
    private var movieRepository:MoviesListRepositoryContract
    
    //MARK:- initializar
    init(movieRepository: MoviesListRepositoryContract = MovieListRepository()) {
        self.movieRepository = movieRepository
        super.init()
    }
    
    func execute(with pageIndex: Int, and limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError> {
        movieRepository.fetchMoviesList(using: pageIndex, limitPages: limitPages)
    }
    
}
