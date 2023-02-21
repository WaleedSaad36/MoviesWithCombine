//
//  BaseViewController.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import UIKit
import Combine
class BaseViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    
    deinit {
        print("deinit ", self.self)
    }
}
