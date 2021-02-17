//
//  
//  HomeView.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Propertiers
    @StateObject private var viewModel: HomeViewModel = .init()
    @AppStorage("currentTabRoot") var currentTabRoot: Int = 0
    
    // MARK: - View
    var body: some View {
        NavigationView {
            TabView(selection: $currentTabRoot.animation(.linear)) {
                ProfileView()
                    .tag(IndexTabRoot.profile.rawValue)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("profile")
                    }
                
                BillboardView()
                    .tag(IndexTabRoot.billboard.rawValue)
                    .tabItem {
                        Image(systemName: "list.bullet.below.rectangle")
                        Text("billboard")
                    }
                
//                Text("complex")
//                    .tag(IndexTabRoot.complex.rawValue)
//                    .tabItem {
//                        Image(systemName: "cart.fill")
//                        Text("complex")
//                    }
            }
            .accentColor(.primaryColor)
            .transition(.slide)
            .animation(.linear)
            .tabViewStyle(DefaultTabViewStyle())
            .navigationBarTitle(self.title.localized, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var title: String {
        switch currentTabRoot {
            case IndexTabRoot.profile.rawValue:
                return "profile"
            default:
                return "billboard"
        }
    }
    // MARK: - funcs
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
