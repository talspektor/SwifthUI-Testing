//
//  ContentView.swift
//  Shared
//
//  Created by Tal Spektor on 19/08/2022.
//

import SwiftUI
import Photos

struct ContentView: View {
    // MARK: Picker properties
    @State var showPicker: Bool = false
    @State var pickedImages: [UIImage] = []
    var body: some View {
        NavigationView {
            TabView {
                ForEach(pickedImages, id: \.self) { image in
                    GeometryReader { proxt in
                        let size = proxt.size
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(15)
                    }
                    .padding()
                }
            }
            .frame(height: 450)
            // MARK: SwiftUI Bug
            // If you don't have any views inside tabview
            // It's crashing, but not in never
            .tabViewStyle(.page(indexDisplayMode: pickedImages.isEmpty ? .never : .always))
            .navigationTitle("Popup Image Picker")
            .toolbar {
                Button {
                    showPicker.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .popupImagePickre(show: $showPicker) { assets in
            // MARK: Do operation with PHAsset
            // Extracting image .init() means extract size of the image
            let manager = PHCachingImageManager.default()
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            
            DispatchQueue.global(qos: .userInteractive).async {
                assets.forEach { asset in
                    manager.requestImage(for: asset, targetSize: .init(), contentMode: .default, options: options) { image, _ in
                        guard let image = image else { return }
                        DispatchQueue.main.async {
                            self.pickedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
