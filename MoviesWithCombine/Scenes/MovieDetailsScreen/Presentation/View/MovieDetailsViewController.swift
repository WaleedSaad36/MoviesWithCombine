//
//  MovieDetailsViewController.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    //MARK:- outlets
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imageMovie: AsyncImageView!
    
    //MARK:-private properties
    private var viewmodel: MovieDetailsViewModel
    
    //MARK:- LifyCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        loadMovieImage()
    }
    //MARK:- Initializar
    init(movieData:MoviesListResonse){
        self.viewmodel = .init(photoData: movieData)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    @IBAction func TappedOnBackBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - UIScrollViewDelegate

extension MovieDetailsViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageMovie
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        guard
            let image = imageMovie.image,
            scrollView.zoomScale > 1
        else {
            scrollView.contentInset = .zero
            return
        }
        
        let ratioW = imageMovie.frame.width / image.size.width
        let ratioH = imageMovie.frame.height / image.size.height
        
        let ratio = ratioW < ratioH ? ratioW : ratioH
        let newWidth = image.size.width * ratio
        let newHeight = image.size.height * ratio
        let conditionLeft = newWidth*scrollView.zoomScale > imageMovie.frame.width
        let left = 0.5 * (conditionLeft ? newWidth - imageMovie.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
        let conditioTop = newHeight*scrollView.zoomScale > imageMovie.frame.height
        
        let top = 0.5 * (conditioTop ? newHeight - imageMovie.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
        
        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
    }
}
// MARK: - Private Methods
private extension MovieDetailsViewController {
    func setupScrollView() {
        scrollview.delegate = self
        scrollview.minimumZoomScale = 1.0
        scrollview.maximumZoomScale = 10.0
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
    }
    
    func loadMovieImage() {
        imageMovie.setImage(using: viewmodel.movieURL)
    }
}
