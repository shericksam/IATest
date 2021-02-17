//
//  
//  CinemaRepository.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

class CinemaRepository {
    // MARK: - variables
    static var shared: CinemaRepository = .init()
    lazy var api: APIClient = { .shared }()
    
    func getCinemas(_ data: ProfileRequest = .init()) throws -> Profile {
        return try api.getProfile(data).get()
    }
}

