//
//  AppViewModel.swift
//  FurnitureAppUI (iOS)
//
//  Created by Tal Spektor on 25/08/2022.
//

import SwiftUI

class AppViewModel: ObservableObject {
    // MARK: Properties
    @Published var currentTab: Tab = .home
    // MARK: Home Properties
    @Published var currentMenu: String = "All"
    // MARK: Detail View Properties
    @Published var showDetailView: Bool = false
    @Published var currentActiveItem: Furniture?
}
