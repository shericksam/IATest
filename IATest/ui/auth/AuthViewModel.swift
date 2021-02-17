//
//  
//  AuthViewModel.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import SwiftUI
import Combine
import RetroSwift

class AuthViewModel: ObservableObject {
    // MARK: - Propertiers
    lazy var notifier: NotificationService = { .shared }()
    @Published var username = "pruebas_beto_ia@yahoo.com"
    @Published var password = "Pruebas01"
    @Published var isLoading: Bool = false
    @Published var isValid = false
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("tokenType") var tokenType: String = ""
    @AppStorage("token") var token: String = ""
    @AppStorage("refreshToken") var refreshToken: String = ""
    private lazy var authRepository: AuthRepository = { .shared }()
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.4, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                return password.isEmpty
            }
            .eraseToAnyPublisher()
    }
    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.4, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return input.count >= 3
            }
            .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUsernameValidPublisher, isPasswordEmptyPublisher)
            .map { usernameIsValid, passwordIsValid in
                return usernameIsValid && (!passwordIsValid)
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
    // MARK: - funcs
    
    func onLogin() {
        self.isLoading = true
        Coroutines.io {
            do {
                let authRequest = AuthRequest(username: self.username, password: self.password)
                let result = try self.authRepository.login(authRequest)
                print("onLogin result", result)
                Coroutines.main {
                    self.isLoading = false
                    self.token = result.accessToken
                    self.tokenType = result.tokenType
                    self.refreshToken = result.refreshToken
                    self.isLogged = true
                }
            } catch let error as ApiErrorModel {
                Coroutines.main {
                    print("error onLogin ", error.localizedDescription)
                    self.isLoading = false
                    self.notifier.showBanner("error", error.localizedDescription, .danger)
                }
            }
        }
    }
    
}
