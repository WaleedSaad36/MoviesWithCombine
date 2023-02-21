//
//  MovieCell.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    //MARK:- OutLets
    @IBOutlet weak var imageMovie: AsyncImageView!
    @IBOutlet weak var titleMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- ConfigrationDataModel
    func configer(movieData:MoviesListResonse){
        self.imageMovie.setImage(using: movieData.downloadURL)
        self.titleMovie.text = movieData.author
    }
    func configerAds(data:MoviesListResonse){
        self.imageMovie.setImage(using: data.downloadURL)
    }

}
