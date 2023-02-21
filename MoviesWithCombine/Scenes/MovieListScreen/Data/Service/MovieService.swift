//
//  MovieService.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Combine
final class MovieService:DisposeObject,MovieListServiceContract{
    
    //MARK:- Properties
    private var apiService:APIServiceContract
    
    //MARK:- initializar
    init(apiService :APIServiceContract = APIService.shared) {
        self.apiService = apiService
        super.init()
    }
    //MARK:- Mtehods
    func fetchMoviesList(using pageIndex: Int, limitPages: Int) -> AnyPublisher<[MoviesListResonse], BaseError> {
        let request = APIBuilder().setPath(using: .fetchMovieListPath, argument: ["\(pageIndex)","\(limitPages)"])
            .setMethod(using: .get)
            .build()
        return apiService.request(using: request, responseType: [MoviesListResonse].self)
    }
}
