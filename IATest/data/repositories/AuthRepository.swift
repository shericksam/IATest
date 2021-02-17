//
//  AuthRepository.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import Foundation

class AuthRepository {
    static var shared: AuthRepository = .init()
    lazy var api: APIClient = { .shared }()
    
    func login(_ data: AuthRequest) throws -> AuthResponse {
        return try api.login(data).get()
    }
}

