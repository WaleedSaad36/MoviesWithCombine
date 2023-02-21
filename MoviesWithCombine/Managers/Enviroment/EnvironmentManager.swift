//
//  EnvironmentManager.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation

import Foundation

final class EnvironmentManager {
    enum UserDefined: String {
        case productName = "CFBundleName"
        case productBundle = "CFBundleIdentifier"
        case productVersion = "CFBundleShortVersionString"
        case productBuild = "CFBundleVersion"
        case serverScheme = "SERVER_SCHEME"
        case serverHost = "SERVER_HOST"
        case apiKeyPrivate = "dbd8cba02da6402545ca2e9ea71a4b1007433aed"
        case apiKeyPublic = "647e5af30f1d4978a23c64d8c4f612a8"
        case imageURL = "MOVIE_IMAGE_URL"

    }
    
    static let shared = EnvironmentManager()
    
    private var infoDict: [String: Any]
    
    private init() {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Couldn't find plist file")
        }
        
        infoDict = dict
    }
    
    /// Method to fetch String value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    func string(key: UserDefined) -> String {
        return self.fetch(key: key.rawValue)
    }
    
    /// Method to fetch Boolean value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    func boolean(key: UserDefined) -> Bool {
        return self.infoDict[key.rawValue] as? Bool ?? false
    }
    
    /// Method to fetch Dictionary value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    func dictionary(key: UserDefined) -> [String: Any] {
        return (self.infoDict[key.rawValue] as? [String:Any]).value
    }
    
    /// Method to fetch String value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    private func fetch(key: String) -> String {
        return (self.infoDict[key] as? String).value
    }
}
