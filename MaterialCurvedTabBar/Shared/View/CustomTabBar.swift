//
//  CustomTabBar.swift
//  MaterialCurvedTabBar (iOS)
//
//  Created by Tal Spektor on 24/08/2022.
//

import SwiftUI

// This App will work for both iOS 14/15...
struct CustomTabBar: View {
    
    // Current Tab...
    @State var currentTab: Tab = .Home
    
    // Hiding Native one...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    // Current Tab XValue...
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            SampleCards(color: .purple, count: 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Home)
            
            Text("Search")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Search)
            
            Text("Notification")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Notifications)
            
            Text("Settings")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Account)
        }
        // Curved Tab bar...
        .overlay(
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
            }
                .padding(.vertical)
                // Preview wont show safeArea...
                .padding(.bottom, getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
                .background(
                    
                    MaterialEffect(style: .systemUltraThinMaterialDark)
                        .clipShape(BottomCurve(currentXValue: currentXValue))
                )
            
            ,alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        // Always dark...
        .preferredColorScheme(.dark)
    }
    
    // Sample Cards...
    @ViewBuilder
    func SampleCards(color: Color, count: Int) -> some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 12) {
                    
                    ForEach(1...6, id: \.self) { index in
                        
                        Image("post\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                            .cornerRadius(12)
                    }
                }
                .padding()
                // Proxy bottom padding...
                // 30 Size...
                // Padding = 30
                // Bottom Edge...
                .padding(.bottom, 60)
                .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
            }
            .navigationTitle("Home")
        }
    }
    
    // TabButton
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        
        // Since we need xAxis for curve...
        GeometryReader { proxy in
            
            Button {
                withAnimation(.spring()) {
                    currentTab = tab
                    // updating value...
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                
                // Moving button up for current tab
                
                Image(systemName: tab.rawValue)
                // Since we need perfect value for curve...
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        
                        ZStack {
                            
                            if currentTab == tab {
                                MaterialEffect(style: .systemChromeMaterialDark)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
            }
            // Setting intial curve position...
            .onAppear {
                if tab == Tab.allCases.first && currentXValue == 0 {
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 30)
        // MaxSise...

    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

// To Iterate...
// Enum for Tab....
enum Tab: String, CaseIterable {
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Notifications = "bell.fill"
    case Account = "person.fill"
}

// Getting safe area...
extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return .zero }
        
        return safeArea
    }
}
