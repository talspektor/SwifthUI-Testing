//
//  AppItem.swift
//  CursorGlow (iOS)
//
//  Created by Tal Spektor on 01/09/2022.
//

import SwiftUI

// MARK: Sample App Items
struct AppItem: Identifiable {
    var id = UUID().uuidString
    var imageName: String
}

var appItems = [

    AppItem(imageName: "App Store"),
    AppItem(imageName: "Calculator"),
    AppItem(imageName: "Calendar"),
    AppItem(imageName: "Camera"),
    AppItem(imageName: "Clock"),
    AppItem(imageName: "Facetime"),
    AppItem(imageName: "Health"),
    AppItem(imageName: "Mail"),
    AppItem(imageName: "Maps"),
    AppItem(imageName: "Messages"),
    AppItem(imageName: "News"),
    AppItem(imageName: "Phone"),
    AppItem(imageName: "Photos"),
    AppItem(imageName: "Safari"),
    AppItem(imageName: "Settings"),
    AppItem(imageName: "Stocks"),
    AppItem(imageName: "Wallet"),
    AppItem(imageName: "Weather"),
]
