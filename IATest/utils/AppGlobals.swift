//
//  AppGlobals.swift
//
//  Created by Erick Guerrero on 16/02/21.
//

import UIKit
import SwiftUI

enum AppConstants {
    static let enviroment : NetworkEnvironment = .dev
    
    static let prodUrl = "{{url}}"
    static let testUrl = "{{url}}"
    
    static var finalURL: String {
        switch AppConstants.enviroment {
            case .production: return prodUrl
            case .qa: return testUrl
            case .dev: return testUrl
            case .dev_b: return testUrl
        }
    }
    
    static let isLogged = "isLogged"
    static let tokenType = "tokenType"
    static let token = "token"
    static let refreshToken = "refreshToken"
}

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

public enum NetworkEnvironment {
    case qa
    case production
    case dev
    case dev_b
}
