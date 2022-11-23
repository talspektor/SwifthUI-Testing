//
//  ContentView.swift
//  Shared
//
//  Created by Tal Spektor on 19/09/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isPresent = false
    var body: some View {
        Directory()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
