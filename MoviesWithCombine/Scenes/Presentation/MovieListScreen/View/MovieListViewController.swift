//
//  MovieListViewController.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import UIKit

class MovieListViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var MovieCollectionView: UICollectionView!
    
    //MARK:- Properties
    weak var coordinator: AppCoordinator?
    
    //MARK:- Private Properties
    private var viewmodel = MovieListViewModel()
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
        setTableViewCellConfigration()
        subscribeMovieListChanges()
        self.viewmodel.loadMovieList()
    }
    
    //MARK:- Initializer
    
    //MARK:- Private Methods
    private func setupNavigationBar(){
        self.navigationItem.title = "Movie List"
    }
    private func setTableViewCellConfigration() {
        self.MovieCollectionView.registerCellNib(MovieCell.self)
        self.MovieCollectionView.delegate = self
        self.MovieCollectionView.dataSource = self
        self.MovieCollectionView.showsVerticalScrollIndicator = false
        self.MovieCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func subscribeMovieListChanges(){
        viewmodel.$movieList.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.MovieCollectionView.reloadData()
            }
        }.store(in: &cancellables)
    }
    
    
}
extension MovieListViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row == viewmodel.movieList.count - 2 else {return}
        viewmodel.loadMoreMovieList()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension MovieListViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MovieCell = collectionView.dequeue(at:indexPath)
        let isWideCell:Bool = viewmodel.isWideCell(for: indexPath)
        let configerMovieCell =  cell.configer(movieData: viewmodel.getMovieData(for: indexPath))
        let configerAdsCell =  cell.configerAds(data: viewmodel.getMovieData(for: indexPath))
       
        isWideCell ? configerAdsCell : configerMovieCell
        return cell
    }
}

extension MovieListViewController:CollectionViewCustomLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, sizeOfItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize()
    }
}
