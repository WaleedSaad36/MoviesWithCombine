//
//  Ex+NSObject+Helpers.swift
//  MarvelTask
//
//  Created by Waleed Saad on 28/01/2023.
//

import Foundation

extension NSObject {
    /// Returns the receiver's classname as a string, not including the namespace.
    class var classNameWithoutNamespaces: String {
        return String(describing: self)
    }
}
