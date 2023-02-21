//
//  ErrorType+Message.swift
//  Marvel Task
//
//  Created by Waleed Saad on 19/05/2022.
//

import Foundation

extension ErrorType {
    var message: String {
        switch self {
        case .connection: return "Connection Reason"
        case .unwrappedHttpClient: return "Unwrapped HTTP Client Reason"
        case .unwrappedHttpServer: return "Unwrapped HTTP Server Reason"
        case .mapping: return "Mapping Reason"
        case .logical: return "Logical Reason"
        case .hardware: return "Hardware Reason"
        case .exception: return "Exception Reason"
        case .permission: return "Permission Reason"
        case .validation: return "Validation Reason"
        case .unexpected: return "Unexpected Reason"
        case .wrappedHttpClient: return "wrapped HTTP Client Reason"
        case .wrappedHttpServer: return "wrapped HTTP Server Reason"
        case .business: return "Business Reason"
        }
    }
}
