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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
