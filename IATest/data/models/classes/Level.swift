//
//  
//  Level.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct Level: Codable {
    // MARK: - variables
    var advancePercent: Int
    var key, message, name, nextLevel: String
    
    enum CodingKeys: String, CodingKey {
        case advancePercent = "advance_percent"
        case key, message, name
        case nextLevel = "next_level"
    }
}

