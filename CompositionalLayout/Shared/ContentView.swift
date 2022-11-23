//
//  ContentView.swift
//  Shared
//
//  Created by Tal Spektor on 02/09/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @EnvironmentObject var imageFetcher: ImageFetcher
    var body: some View {
        NavigationView {
            ScrollView {
                // MARK: Custom view
                if let images = imageFetcher.fetchedImages {
                    CompositionalView(items: images, id: \.id) { item in
                        GeometryReader { proxy in
                            let size = proxy.size
                            WebImage(url: URL(string: item.download_url))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Compositional Layout")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
