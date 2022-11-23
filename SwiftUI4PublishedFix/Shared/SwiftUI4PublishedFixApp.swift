//
//  SwiftUI4PublishedFixApp.swift
//  Shared
//
//  Created by Tal Spektor on 30/08/2022.
//

import SwiftUI

@main
struct SwiftUI4PublishedFixApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
