//
//  MovieDetailsViewModel.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
typealias MovieDetailsViewModelContract = BaseViewModel & MovieDetailsViewModelOutput

protocol MovieDetailsViewModelOutput {
    var movieURL: String? { get }
}

final class MovieDetailsViewModel: MovieDetailsViewModelContract {
    private let movieData: MoviesListResonse
    
    var movieURL: String? {
        return movieData.downloadURL
    }
    
    init(photoData: MoviesListResonse) {
        self.movieData = photoData
        super.init()
    }
}
