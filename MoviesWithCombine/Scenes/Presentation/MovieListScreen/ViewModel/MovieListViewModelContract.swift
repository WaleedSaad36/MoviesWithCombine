//
//  MovieListViewModelContract.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation

typealias MovieListViewModelContract = BaseViewModel & MovieListViewModelInput & MovieListViewModelOutPut

protocol MovieListViewModelInput{
    func loadMovieList()
    func loadMoreMovieList()
    func handleOnErrorFetchingMovies(_ error: Error)
}

protocol MovieListViewModelOutPut{
    func getMovieData(for indexPath: IndexPath) -> MoviesListResonse
    func getMovieSize(for indexPath: IndexPath) -> (Float,Float)
    func isWideCell(for indexPath:IndexPath) -> Bool
}
