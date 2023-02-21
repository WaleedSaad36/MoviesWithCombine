//
//  MovieListRepository.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine

final class MovieListRepository:DisposeObject, MoviesListRepositoryContract{
    //MARK:- Private Properties

    private let movieService:MovieListServiceContract
    private let reachability: ReachabilityManager
    private let storage: MoviesStorageManager
    //MARK:- initializar

    init(movieService: MovieListServiceContract = MovieService(), rechability: ReachabilityManager = ReachabilityManager(), storage: MoviesStorageManager = MoviesStorageManager()) {
        self.movieService = movieService
        self.reachability = rechability
        self.storage = storage
    }
    
    func fetchMoviesList(using pageIndex: Int, limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError> {
        guard reachability.isConnectedToNetwork()else{
           
        
        return fetchMoviesFromCach()
            .eraseToAnyPublisher()
        }
         
        return fetchMoviesFromServerAndSaveInCach(using: pageIndex, limitPages: limitPages)
        .eraseToAnyPublisher()
        
        
    }

}


private extension MovieListRepository{
    private func fetchMoviesFromServerAndSaveInCach(using pageIndex: Int, limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError>{
        let remoteMovies = self.movieService.fetchMoviesList(using: pageIndex, limitPages: limitPages)
        

        return remoteMovies.map{ result in
            self.storage.saveAll(result)
            return result
        }.eraseToBaseError().eraseToAnyPublisher()
    }
    
    private func fetchMoviesFromCach() -> AnyPublisher<[MoviesListResonse], BaseError>{
        
        let dataFromCach = self.storage.fetchAll()
        
        return dataFromCach.eraseToAnyPublisher()
    }
}
