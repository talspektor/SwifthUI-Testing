//
//  ContentView.swift
//  Shared
//
//  Created by Tal Spektor on 22/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BaseView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BaseViewModel())
    }
}
