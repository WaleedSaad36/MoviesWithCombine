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
