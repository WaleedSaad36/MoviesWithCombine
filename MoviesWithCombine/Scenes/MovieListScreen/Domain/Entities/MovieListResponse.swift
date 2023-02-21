//
//  MovieListResponse.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//


import Foundation
import Combine
// MARK: - MoviesListResonse
struct MoviesListResonse: Decodable{
    var id: String
    var author: String
    var width, height: Int
    var url, downloadURL: String
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

