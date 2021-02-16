//
//  IATestApp.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import SwiftUI

@main
struct IATestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
