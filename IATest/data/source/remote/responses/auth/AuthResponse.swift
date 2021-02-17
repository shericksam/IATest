//
//  
//  AuthResponse.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import Foundation

struct AuthResponse: Codable {
    // MARK: - variables
    var accessToken, tokenType: String
    var expiresIn: Int
    var refreshToken, asClientID, username, countryCode: String
    var issued, expires: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case asClientID = "as:client_id"
        case username
        case countryCode = "country_code"
        case issued = ".issued"
        case expires = ".expires"
    }
}

