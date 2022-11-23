//
//  View+Modifiers.swift
//  UITests
//
//  Created by Tal Spektor on 26/09/2022.
//

import Foundation
import SwiftUI

extension View {
    func roundedBorder(cornerRadius: CGFloat, color: Color) -> some View {
        modifier(RoundedBorder(cornerRadius: cornerRadius, color: color))
    }
}

struct RoundedBorder: ViewModifier {
    let cornerRadius: CGFloat
    let color: Color
    let lineWidth: CGFloat
    
    init(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat = 1) {
        self.cornerRadius = cornerRadius
        self.color = color
        self.lineWidth = lineWidth
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .cornerRadius(cornerRadius)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(color, lineWidth: lineWidth)
                )
        }
    }
}
