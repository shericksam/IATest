//
//  
//  ProfileResponse.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct ProfileResponse: Codable {
    // MARK: - variables
    var email, name, phoneNumber, profilePicture: String
    var cardNumber: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case name = "first_name"
        case phoneNumber = "phone_number"
        case profilePicture = "profile_picture"
        case cardNumber = "card_number"
    }
}
