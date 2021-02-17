//
//  
//  TransactionsRequest.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct TransactionsRequest: Codable {
    // MARK: - variables
    var cardNumber: String
    var countryCode: String = "MX"
    var transactionInclude: Bool = true
    var pin: String
    
    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case countryCode = "country_code"
        case transactionInclude = "transaction_include"
        case pin
    }
}

