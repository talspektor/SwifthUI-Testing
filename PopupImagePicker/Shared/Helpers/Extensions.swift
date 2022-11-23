//
//  Extensions.swift
//  PopupImagePicker
//
//  Created by Tal Spektor on 20/08/2022.
//

import SwiftUI
import Photos

// MARK: Custom modifier
extension View {
    @ViewBuilder
    func popupImagePickre(show: Binding<Bool>, transition: AnyTransition = .move(edge: .bottom), onSelect: @escaping ([PHAsset]) -> Void) -> some View {
        self
            .overlay {
                let deviceSize = UIScreen.main.bounds.size
                ZStack {
                    // MARK: BG blur
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .opacity(show.wrappedValue ? 1 : 0)
                        .onTapGesture {
                            show.wrappedValue = false
                        }
                    
                    if show.wrappedValue {
                        PoupImagePickerView {
                            show.wrappedValue = false
                        } onSelect: { assets in
                            onSelect(assets)
                            show.wrappedValue = false
                        }
                        .transition(transition)
                    }
                }
                .frame(width: deviceSize.width, height: deviceSize.height)
                .animation(.easeInOut, value: show.wrappedValue)
            }
    }
}
