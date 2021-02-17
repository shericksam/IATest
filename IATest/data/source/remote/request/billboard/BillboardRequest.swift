//
//  
//  BillboardRequest.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct BillboardRequest: Codable {
    // MARK: - variables
    var cinema: Int 
    var countryCode: String = "MX"
    
    enum CodingKeys: String, CodingKey {
        case cinema
        case countryCode = "country_code"
    }
}

