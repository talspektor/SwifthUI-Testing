//
//  ContentView.swift
//  Shared
//
//  Created by Tal Spektor on 30/08/2022.
//

import SwiftUI
import CoreData

/// In swift UI 4 we can't bind observable object
struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var isPresented = false

    var body: some View {
        
            Button {
                viewModel.isPresented.toggle()
            } label: {
                Text("Push to go next")
            }
            .sheet(isPresented: $isPresented) {
                DetailView()
                    .environmentObject(viewModel)
            }
            .sync($viewModel.isPresented, with: $isPresented)
        
    }
}
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func sync(_ published: Binding<Bool>, with binding: Binding<Bool>) -> some View {
        self
            .onChange(of: published.wrappedValue) { published in
                binding.wrappedValue = published
            }
            .onChange(of: binding.wrappedValue) { binding in
                published.wrappedValue = binding
            }
        
    }
}
