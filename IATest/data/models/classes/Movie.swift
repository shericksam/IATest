//
//  
//  Movie.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct Movie: Codable {
    // MARK: - variables
    var rating: String
    var media: [Media]
    var cinemas: [Int]
    var position: Int
    var categories: [String]
    var genre, synopsis: String
    var length, releaseDate: String?
    var id: Int?
    var name, code, originalName: String?
    
    enum CodingKeys: String, CodingKey {
        case rating, media, cinemas, position, categories, genre, synopsis, length
        case releaseDate = "release_date"
        case id, name, code
        case originalName = "original_name"
    }
}


// MARK: - Media
struct Media: Codable {
    var type: TypeEnum
    var code, resource: String
}

enum TypeEnum: String, Codable {
    case image = "image"
    case video = "video"
}

