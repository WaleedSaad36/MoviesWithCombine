//
//  MovieDetailsViewController.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imageMovie: AsyncImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TappedOnBackBtn(_ sender: Any) {
        dismiss(animated: true)
    }

}
