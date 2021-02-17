//
//  
//  Profile.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct Profile: Codable, Equatable {
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
    init() {
        self.email = ""
        self.name = ""
        self.phoneNumber = ""
        self.profilePicture = ""
        self.cardNumber = ""
    }
}

