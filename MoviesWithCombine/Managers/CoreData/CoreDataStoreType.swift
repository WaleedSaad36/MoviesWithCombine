//
//  CoreDataStoreType.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import CoreData
/// The persistentStore type
/// -  sqLite
/// - inMemory
public enum CoreDataStoreType {
    case sqLite
    case inMemory
}

extension CoreDataStoreType {
    var value: String {
        switch self {
        case .sqLite:
            return NSSQLiteStoreType
        case .inMemory:
            return NSInMemoryStoreType
        }
    }
}
