//
//  BaseError.swift
//  Marvel Task
//
//  Created by Waleed Saad on 19/05/2022.
//

import Foundation

struct BaseError: Error {
    let code: Int
    let message: String
}

extension BaseError: Equatable {}
