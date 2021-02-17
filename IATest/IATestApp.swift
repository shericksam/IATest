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
    @ObservedObject var notifier: NotificationService = .shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(notifier)
        }
    }
}
