//
//  TaskManagementCoreDataApp.swift
//  Shared
//
//  Created by Tal Spektor on 28/08/2022.
//

import SwiftUI

@main
struct TaskManagementCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
