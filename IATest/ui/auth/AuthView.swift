//
//  
//  AuthView.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import SwiftUI

struct AuthView: View {
    
    // MARK: - Propertiers
    @StateObject private var viewModel: AuthViewModel = .init()

    // MARK: - View
    var body: some View {
        VStack {
            Text("welcome")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 40)
            TextField("username", text: $viewModel.username)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("password", text: $viewModel.password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: viewModel.onLogin) {
                Text("signin")
            }
            .buttonStyle(ButtonPrimaryStyle(color: viewModel.isValid ? .primaryColor : .darkGray))
            .disabled(!viewModel.isValid)
        }
            .padding()
            .spiner(self.$viewModel.isLoading)
    }
    
    // MARK: - funcs
}


struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
