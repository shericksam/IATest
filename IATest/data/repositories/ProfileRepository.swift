//
//  
//  ProfileRepository.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation

class ProfileRepository {
    // MARK: - variables
    static var shared: ProfileRepository = .init()
    lazy var api: APIClient = { .shared }()
    
    func getProfile(_ data: ProfileRequest = .init()) throws -> Profile {
        return try api.getProfile(data).get()
    }
}

