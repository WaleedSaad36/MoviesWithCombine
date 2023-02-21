//
//  MovieListViewModel.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Combine
import Foundation

final class MovieListViewModel: MovieListViewModelContract{

    //MARK:- Properties
    private var fetchMovieListUseCase:FetchMovieListUseCaseContract
    private var reachability:ReachabilityContract
    private var pageIndex:Int = 1
    private var limitPages:Int = Constants.pageSize
    @Published var movieList:[MoviesListResonse] = []
    
    
    //MARK:- Initializar
    init(fetchMovieListUseCase: FetchMovieListUseCaseContract = MovieListUseCase()) {
        self.fetchMovieListUseCase = fetchMovieListUseCase
        self.reachability = ReachabilityManager()
        super.init()
    }
    
    // MARK: - Input Methods
    
    func loadMovieList() {
        state = .loading
        fetchMovieListUseCase.execute(with: pageIndex, and: limitPages)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self = self else {return}
                guard case .failure(let error) = completion else { return }
                self.state = .failed(error)
                self.handleOnErrorFetchingMovies(error)
            } receiveValue: { [weak self] result in
                guard let self = self else{return}
                self.movieList += result
                self.state = .successful
            }.store(in: &cancelLables)
    }
    
    func loadMoreMovieList() {
        guard reachability.isConnectedToNetwork() else{return}
        guard state != .loading else {return}
        
            self.pageIndex += 1
            self.loadMovieList()
    }
    
    func handleOnErrorFetchingMovies(_ error: Error) {
        guard pageIndex == 1 else { return }
        guard let error = error as? BaseError else { return }
        alertItem = .init(message: error.message)
    }
    // MARK: - Output Methods
    func getMovieData(for indexPath: IndexPath) -> MoviesListResonse{
        return  self.movieList[indexPath.row]
    }
    func getMovieSize(for indexPath: IndexPath) -> (Float, Float) {
        let item:MoviesListResonse = movieList[indexPath.item]
        let widthImage:Float = Float(item.width)
        let heightImage:Float = Float(item.height)
        
        return (widthImage,heightImage)
    }
    func isWideCell(for indexPath: IndexPath) -> Bool {
        guard indexPath.item % 5 == 0 else{return false}
        return true
    }
}
