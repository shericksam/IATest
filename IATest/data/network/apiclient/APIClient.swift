//
//  APIClient.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import Foundation
import RetroSwift

class APIClient {
    static var shared: APIClient = .init()
    let baseUrl: String = AppConstants.finalURL
    
    lazy var caller: RequestCaller =  {
        let config = URLSessionConfiguration.default
        if #available(iOS 11.0, *) {
            config.waitsForConnectivity = true
        }
        config.allowsConstrainedNetworkAccess = true
        config.urlCredentialStorage = .shared
        return RequestCaller(config: config, nil, true)
    }()
    
    //      -------------------Header auth----------------------------
    func auth() -> [String: String]? {
        let sesionToken = UserDefaults.standard.string(forKey: AppConstants.token) ?? ""
        let tokenType = UserDefaults.standard.string(forKey: AppConstants.tokenType) ?? ""
        return ["Authorization": "\(tokenType) \(sesionToken)",
                "api_key": "stage_HNYh3RaK_Test"]
    }
    
    var cinepolisAuthHeader: [String: String] {
        ["api_key": "stage_HNYh3RaK_Test"]
    }
    
    //    -------------------Auth----------------------------
    func login(_ data: AuthRequest) -> Result<AuthResponse, ApiErrorModel> {
        let request = RequestModel(
            httpMethod: .post,
            path: "v2/oauth/token",
            baseUrl: self.baseUrl,
            payload: data.dictionaryValue,
            headers: cinepolisAuthHeader,
            contentType: .ApplicationJson
        )
        .asURLRequest()
        
        return self.caller.upload(request, data.dictionaryValue?.percentEncoded())
    }
    
    
    //    -------------------Profile----------------------------
    func getProfile(_ data: ProfileRequest) -> Result<Profile, ApiErrorModel> {
        let request = RequestModel(
            httpMethod: .get,
            path: "v1/members/profile",
            baseUrl: self.baseUrl,
            query: data.dictionaryValue,
            headers: self.auth(),
            contentType: .ApplicationJson
        )
        .asURLRequest()
        
        return self.caller.call(request)
    }
}