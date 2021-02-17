//
//  
//  ProfileRequest.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct ProfileRequest: Codable {
    // MARK: - variables
    var countryCode: String = "MX"
    
    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
    }
}

