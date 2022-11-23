//
//  MainView.swift
//  FurnitureAppUI (iOS)
//
//  Created by Tal Spektor on 25/08/2022.
//

import SwiftUI

struct MainView: View {
    // MARK: Veiw properties
    @StateObject var appModel: AppViewModel = .init()
    // MARK: Animation properties
    @Namespace var animation
    // MARK: Hiding native tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $appModel.currentTab) {
            Home(animation: animation)
                .environmentObject(appModel)
                .tag(Tab.home)
                .setupTab()
            
            Text("Cart")
                .tag(Tab.cart)
                .setupTab()
            
            Text("Favorite")
                .tag(Tab.favourite)
                .setupTab()
            
            Text("Profile")
                .tag(Tab.profile)
                .setupTab()
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(currentTab: $appModel.currentTab, animation: animation)
                .offset(y: appModel.showDetailView ? 150 : 0)
        }
        .overlay {
            if let furniture = appModel.currentActiveItem, appModel.showDetailView {
                // MARK: Detail View
                DetailView(furniture: furniture, animation: animation)
                    .environmentObject(appModel)
                    .transition(.offset(x: 1, y: 1))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: Custom extensions
extension View {
    @ViewBuilder
    func setupTab() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("BG")
                    .ignoresSafeArea()
            }
    }
}
