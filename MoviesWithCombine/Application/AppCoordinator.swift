//
//  APpCoordinator.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import UIKit
protocol Coordinator{
    var childCoordinators:[Coordinator]{get}
    var navigationController:UINavigationController {get}
    func startCoordinator()
}

class AppCoordinator:Coordinator{
 
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let movieListViewController = MovieListViewController()
        movieListViewController.coordinator = self
        self.navigationController.pushViewController(movieListViewController, animated: true)
    }
    func presentDetailsScreen(movieData:MoviesListResonse){
        let movieDetailsScreen = MovieDetailsViewController(movieData: movieData)
        movieDetailsScreen.modalPresentationStyle = .fullScreen
        movieDetailsScreen.modalTransitionStyle = .crossDissolve
        self.navigationController.present(movieDetailsScreen, animated: true)
    }
    func handleOpenSafari(urlAds:String){
        if let url = URL(string: urlAds) {
            UIApplication.shared.open(url)
        }
    }
}
