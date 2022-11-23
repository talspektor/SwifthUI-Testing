//
//  Home.swift
//  UITests
//
//  Created by Tal Spektor on 26/09/2022.
//

import SwiftUI

enum ConnectionSate {
    case pending
    case ignored
    case accepted
}

class ViewModel: ObservableObject {
    @Published var state: ConnectionSate = .pending
    
    
    
    func setState() {
        state = .accepted
    }
}

struct Directory: View {
    let text = "Test in ldkfhg kluha lskdjfgh   ;aldjhg;lh"
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            list()
            
            empty()
        }

    }
    
    @ViewBuilder
    func empty() -> some View {
        VStack {
            Text("Empty text")
            
            Card(content: Text("Test"))
                .padding()
//                .background(.green)
            Spacer()
            
        }
    }
    
    @ViewBuilder
    func list() -> some View {
        GeometryReader { proxy in
            ScrollView {
                ForEach(1..<3) { index in
                    
                    Card(
                        content:
                            
                            VStack(alignment: .leading) {
                                if text.getWidth(size: 14) > proxy.size.width - 100 {
                                    vStack()
                                } else {
                                    hStack()
                                }
                                
                                
                                BottomCardRow(state: viewModel.state)
                            }
                    )
                    .padding()
                }
                .padding(0)
                
                Card(content: Text("Test"))
                    .padding()
            }
        }
    }
    
    @ViewBuilder
    func hStack() -> some View {
        HStack {
            textView()
            textView()
        }
    }
    
    @ViewBuilder
    func vStack() -> some View {
        VStack {
            textView()
            textView()
        }
    }
    
    @ViewBuilder
    func textView() -> some View {
        Label {
            Text(text)
            .font(.custom("Helvetica", size: 14))
            .lineLimit(2)
            .background(.cyan)
        } icon: {
            Image(systemName: "star.fill")
                .background(.indigo)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Directory()
    }
}
