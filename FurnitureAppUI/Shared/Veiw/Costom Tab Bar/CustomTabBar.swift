//
//  CustomTabBar.swift
//  MaterialCurvedTabBar (iOS)
//
//  Created by Tal Spektor on 24/08/2022.
//

import SwiftUI

struct CustomTabBar: View {
    // Current Tab...
    @Binding var currentTab: Tab
    var animation: Namespace.ID
    // Current Tab XValue...
    @State var currentXValue: CGFloat = 0
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases,id: \.rawValue) {tab in
                TabButton(tab: tab)
                    .overlay {
                        Text(tab.rawValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("Black"))
                            .offset(y: currentTab == tab ? 15 : 100)
                    }
            }
        }
        .padding(.top)
        // Preview wont show safeArea...
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 10)
        .background {
            Color.white
                .shadow(color: Color("Black").opacity(0.08), radius: 5, x: 0, y: -5)
                .clipShape(BottomCurve(currentXValue: currentXValue))
                .ignoresSafeArea(.container, edges: .bottom)
        }
    }
    // TabButton
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        // Since we need xAxis for curve...
        GeometryReader { proxy in
            Button {
                withAnimation(.easeInOut) {
                    currentTab = tab
                    // updating value...
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                // Moving Button up for current Tab...
                Image(tab.rawValue)
                // Since we need perfect value for Curve...
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.8))
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        ZStack {
                            if currentTab == tab {
                                Circle()
                                    .fill(Color("Orange"))
                                    .shadow(color: Color("Black").opacity(0.1), radius: 8, x: 5, y: 5)
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
    }
}

// MARK: Tabs
enum Tab: String,CaseIterable{
    case home = "Home"
    case cart = "Cart"
    case favourite = "Star"
    case profile = "Profile"
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
