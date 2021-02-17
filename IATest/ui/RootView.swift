//
//  RootView.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import SwiftUI
import CoreData

struct RootView: View {
    @AppStorage("isLogged") var isLogged = false
    
    var body: some View {
        VStack {
            if isLogged {
                HomeView()
            } else {
                AuthView()
            }
        }
        .banner()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
            RootView()
        }
    }
}
