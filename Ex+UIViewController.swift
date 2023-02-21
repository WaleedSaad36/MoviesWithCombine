//
//  Extension+UIViewController.swift
//  MarvelTask
//
//  Created by Waleed Saad on 26/09/2022.
//

import Foundation
import UIKit
extension UIViewController{
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
