//
//  MovieDataEntity.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import Combine

extension MovieDataEntity {
    
    /// Get `MovieData` Data from `MovieDataEntity`
    /// - Returns: MovieData Created from self
    func getMovieData() -> MoviesListResonse{
        return MoviesListResonse(id: self.id ?? "" , author: self.author ?? "", width: Int(self.width), height: Int(self.height), url: self.url ?? "", downloadURL: self.movieURL ?? "")
    }
    
    /// Set `MovieListResponse` Data in `MovieDataEntity`
    /// - Parameter data: MovieData data will used to convert
    func setDataMovies(with movieData: MoviesListResonse) {
        self.id = movieData.id
        self.width = Int32(movieData.width )
        self.height = Int32(movieData.height )
        self.movieURL = movieData.downloadURL
        self.url = movieData.url
    }
}
