//
//  Card.swift
//  UITests
//
//  Created by Tal Spektor on 26/09/2022.
//

import SwiftUI

enum CardDefaultValues {
    static var padding: CGFloat { 20.0 }
    static var borderColor: Color { .black.opacity(0.1) }
    static var cornerRadius: CGFloat { 4.0 }
    static var backgroundColor: Color { .gray.opacity(0.1) }
}

struct Card<Content: View>: View {
    let content: Content
    let cardCornerRadius: CGFloat
    let backgroundColor: Color
    let cardPadding: CGFloat
    let cardBorderColor: Color
    
    init(
        content: Content,
        cardCornerRadius: CGFloat = CardDefaultValues.cornerRadius,
        backgroundColor: Color = CardDefaultValues.backgroundColor,
        cardPadding: CGFloat = CardDefaultValues.padding,
        cardBorderColor: Color = CardDefaultValues.borderColor
    ) {
        self.content = content
        self.cardCornerRadius = cardCornerRadius
        self.backgroundColor = backgroundColor
        self.cardPadding = cardPadding
        self.cardBorderColor = cardBorderColor
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity)
            .padding(cardPadding)
            .background(
                RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
                    .stroke(cardBorderColor)
            )
            .background(
                RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
                    .fill(backgroundColor)
            )
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(content: Text("Card"))
            .padding()
    }
}
