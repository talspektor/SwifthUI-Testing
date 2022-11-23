//
//  CursorGlowApp.swift
//  Shared
//
//  Created by Tal Spektor on 01/09/2022.
//

import SwiftUI

@main
struct CursorGlowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // MRK: Hiding Titel bar
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
