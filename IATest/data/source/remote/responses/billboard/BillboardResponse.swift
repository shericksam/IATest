//
//  
//  BillboardResponse.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

struct BillboardResponse: Codable {
    // MARK: - variables
    var movies: [MovieCD]
    var routes: [RoutesCD]
}


enum Rating: String, Codable {
    case a = "A"
    case b = "B"
    case sC = "S/C"
}
