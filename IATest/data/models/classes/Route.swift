//
//  
//  Route.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct Route: Codable {
    // MARK: - variables
    var code: Code
    var sizes: Sizes
}


// MARK: - Sizes
struct Sizes: Codable {
    var large: String?
    var medium: String
    var small, xLarge: String?
    
    enum CodingKeys: String, CodingKey {
        case large, medium, small
        case xLarge = "x-large"
    }
}

enum Code: String, Codable {
    case backgroundSynopsis = "background_synopsis"
    case poster = "poster"
    case posterHorizontal = "poster_horizontal"
    case ribbon = "ribbon"
    case trailerMp4 = "trailer_mp4"
}
