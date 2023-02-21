//
//  MovieListViewController.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import UIKit

class MovieListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var MovieCollectionView: UICollectionView!
    
    //MARK:- Properties
    weak var coordinator: AppCoordinator?
    
    //MARK:- Private Properties
    private lazy var MovieCustomCollectionViewLayout: PhotosCollectionViewCustomLayout = {
        let layout = PhotosCollectionViewCustomLayout(
            delegate: self,
            numberOfColums: 1,
            cellPadding: 5
        )
        return layout
    }()
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    //MARK:- Initializer
    
    //MARK:- Private Methods
    private func setupNavigationBar(){
        self.navigationItem.title = "Movie List"
    }
    private func setTableViewCellConfigration() {
        self.MovieCollectionView.registerCellNib(MovieCell.self)
//        self.MovieCollectionView.delegate = self
//        self.MovieCollectionView.dataSource = self
        self.MovieCollectionView.showsVerticalScrollIndicator = false
        self.MovieCollectionView.showsHorizontalScrollIndicator = false
    }
    
    
    
}

extension MovieListViewController:CollectionViewCustomLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, sizeOfItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize()
    }
    
    
}
