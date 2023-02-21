//
//  Navigation+Helpers.swift
//  MarvelTask
//
//  Created by Waleed Saad on 21/09/2022.
//

import Foundation
import UIKit

extension UIViewController{
    func setupNavigationController() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let newNavbar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: .zero))
        let navItem = UINavigationItem()

        newNavbar.setItems([navItem], animated: false)
        view.addSubview(newNavbar)
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .blackOff()

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
  
       ///// add cornerRedius Nav
        self.navigationController?.navigationBar.layer.cornerRadius = 15
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        navigationController?.navigationBar.shadowImage = UIImage().withTintColor(.blackOff())
    }
    
    func setTitleViewController(to title:String, fontColor: UIColor = .black, isPrefersLarge: Bool = false) {
        /////// NavBar Prefers
        if isPrefersLarge {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeContentTitle = title
            self.navigationController?.navigationItem.backButtonTitle = title
        }else{
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
            titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            titleLabel.textAlignment = .init(.center)
            titleLabel.text = title
            titleLabel.textColor = fontColor
            self.navigationItem.titleView = titleLabel
        }
    }
    
    func addLogoToNavigationBarItem() {
        
        let imageView = UIImageView(image: UIImage(named: "marvel-logo"))
            imageView.contentMode = .scaleAspectFill
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 175, height: 100))
            imageView.frame = titleView.bounds
            titleView.addSubview(imageView)

            self.navigationItem.titleView = titleView
    }
    func setupBackButton(isWhite: Bool = false) {
        if isWhite{
            navigationController?.navigationBar.tintColor = .white
        }else{
            navigationController?.navigationBar.tintColor = .black
        }
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward")?.withTintColor(.black), style: .plain , target: self, action: #selector(backButtonPressed))
        self.navigationItem.leftBarButtonItem = backButton
    }
 
    
    func setupSearchButton(){
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.red, renderingMode: .alwaysOriginal), style: .plain , target: self, action: #selector(searchButtonPressed))
        self.navigationItem.rightBarButtonItem = searchButton
        
    }
}

// MARK:- Actions
extension UIViewController {
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func searchButtonPressed() {
        print("go to Search Screen")
    }
}

