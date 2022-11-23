//
//  CompositionalLayoutApp.swift
//  Shared
//
//  Created by Tal Spektor on 02/09/2022.
//

import SwiftUI

@main
struct CompositionalLayoutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ImageFetcher.init())
        }
    }
}
