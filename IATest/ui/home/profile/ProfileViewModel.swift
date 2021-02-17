//
//  
//  ProfileViewModel.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import SwiftUI
import RetroSwift

class ProfileViewModel: ObservableObject {
    // MARK: - variables
    lazy var notifier: NotificationService = { .shared }()
    @Published var isLoading: Bool = false
    @Published var profile: Profile = .init()
    private lazy var profileRepository: ProfileRepository = { .shared }()
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("tokenType") var tokenType: String = ""
    @AppStorage("token") var token: String = ""
    @AppStorage("refreshToken") var refreshToken: String = ""
//
    @Published var cardNumber: String = ""
    
    func getProfile() {
        self.isLoading = true
        Coroutines.io {
            do {
                let result = try self.profileRepository.getProfile()
                print("getProfile result", result)
                Coroutines.main {
                    self.isLoading = false
                    self.profile = result
                }
            } catch let error as ApiErrorModel {
                Coroutines.main {
                    print("error getProfile", error.localizedDescription)
                    self.isLoading = false
                    self.notifier.showBanner("error", error.localizedDescription, .danger)
                }
            }
        }
    }
    
    func logout() {
        self.isLogged = false
        self.tokenType = ""
        self.token = ""
        self.refreshToken = ""
    }
}

