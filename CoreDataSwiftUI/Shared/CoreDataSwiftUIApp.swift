//
//  CoreDataSwiftUIApp.swift
//  Shared
//
//  Created by Tal Spektor on 30/08/2022.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.conteiner.viewContext)
            
        }
    }
}
