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
    
}
