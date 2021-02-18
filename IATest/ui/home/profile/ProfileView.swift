//
//  
//  ProfileView.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Propertiers
    @StateObject var viewModel: ProfileViewModel = .init()
    @StateObject var imgLoader = WebImageLoader(urlString: nil)
    @State var showingAlert: Bool = false
    
    // MARK: - View
    var body: some View {
        VStack {
            if ((imgLoader.urlString?.isEmpty) != nil) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding()
            } else {
                WebImage(loader: imgLoader, displayLoadingImg: false)
                    .frame(maxWidth: 70, maxHeight: 70)
                    .background(Color(.systemBackground))

            }
            Form {
                Section(header: Text("welcome")) {
                    HStack {
                        Text("username:")
                        Spacer()
                        Text(viewModel.profile.name)
                    }
                    HStack {
                        Text("email:")
                        Spacer()
                        Text(viewModel.profile.email)
                    }
                    
                    HStack {
                        Text("card:")
                        Spacer()
                        Text(viewModel.profile.cardNumber)
                    }
                }
                
                Section(header: Text("transactions")) {
                    NavigationLink("check-card", destination:
                            AddCardsView()
                                .environmentObject(viewModel)
                    )
                }
            }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("confirm"),
                        message: Text("confirm-close-session"),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(Text("yes"), action: viewModel.logout)
                    )
                }
                .onChange(of: viewModel.profile) { (value) in
                    imgLoader.urlString = value.profilePicture
                    imgLoader.loadImage()
                }
            Button("logout", action: onCloseSesion)
                .buttonStyle(ButtonPrimaryStyle())
                .padding(.bottom)
                .background(Color(.tertiarySystemBackground))
        }
        .spiner(self.$viewModel.isLoading)
        .onAppear(perform: viewModel.getProfile)
    }
    
    // MARK: - funcs
    
    func onCloseSesion() {
        self.showingAlert.toggle()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
