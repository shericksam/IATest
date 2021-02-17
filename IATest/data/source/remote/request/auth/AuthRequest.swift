//
//  
//  AuthRequest.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import Foundation

struct AuthRequest: Codable {
    // MARK: - variables
    var countryCode: String = "MX"
    var username: String
    var password: String
    var grantType: String = "password"
    var clientId: String = "IATestCandidate"
    var clientSecret: String = "c840457e777b4fee9b510fbcd4985b68"
    
    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case grantType = "grant_type"
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case username, password
        
    }
}

