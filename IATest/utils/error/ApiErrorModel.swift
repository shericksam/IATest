//
//  
//  ApiErrorModel.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import Foundation
import RetroSwift

struct ApiErrorModel: DecodableError {
    var status: Int?
    
    var errorCode: Int?
    
    var errorDetail: String?
    
    // MARK: - variables
    var error: String?
    var errorDescription: String?
    
    public init() {
        
    }
    enum CodingKeys: String, CodingKey {
        case error, status, errorCode, errorDetail
        case errorDescription = "error_description"
    }
}

extension ApiErrorModel: LocalizedError {
    public var localizedDescription: String {
        if let error = self.errorDescription {
            return error
        } else if let error = self.error {
            return error
        }
        return "Error in model"
    }
}
