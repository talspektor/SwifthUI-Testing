//
//  ImageAsset.swift
//  PopupImagePicker
//
//  Created by Tal Spektor on 19/08/2022.
//

import SwiftUI
import PhotosUI

// MARK: Selected image asset model
struct ImageAsset: Identifiable {
    var id: String = UUID().uuidString
    var asset: PHAsset
    var thumbnail: UIImage?
    // MARK: selected image index
    var assetIndex: Int = -1
    
}
