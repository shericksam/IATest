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
    var message: String?
    var statusCode: Int?
    public init() {
        
    }
    enum CodingKeys: String, CodingKey {
        case error, status, errorCode, errorDetail,message
        case errorDescription = "error_description"
        case statusCode = "status_code"
    }
}

extension ApiErrorModel: LocalizedError {
    public var localizedDescription: String {
        if let error = self.errorDescription {
            return error
        } else if let error = self.error {
            return error
        } else if  let error = self.message {
            return error
        }
        return "Error in model"
    }
}
