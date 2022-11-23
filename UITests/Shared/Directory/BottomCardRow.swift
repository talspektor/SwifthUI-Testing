//
//  BottomCardRow.swift
//  UITests
//
//  Created by Tal Spektor on 27/09/2022.
//

import SwiftUI

struct BottomCardRow: View {
    let state: ConnectionSate
    
    var body: some View {
        getViewByState()
    }
    
    @ViewBuilder
    func getViewByState() -> some View {
        switch state {
        case .pending:
            Pending(handshakeId: "", backgroundColor: .gray, onAccept: { _ in }, inIgnore: { _ in })
        case .accepted:
            Accepted()
        case .ignored:
            Ignored()
        }
    }
}

struct Pending: View {
    let handshakeId: String
    let backgroundColor: Color
    let onAccept: (String) -> Void
    let inIgnore: (String) -> Void
    
    var body: some View {
        let acceptButtonColor = Color.green
        let acceptButtonTextColor = Color.white
        let acceptButtonCornerRadius = CGFloat(4)
        let ignoreButtonTextColor = Color.black
        let buttonsFont = Font.custom("Helvetica", size: 14)
        
        HStack(alignment: .center) {
            
            Button {
                onAccept(handshakeId)
            } label: {
                Text("accept")
                    .foregroundColor(acceptButtonTextColor)
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(acceptButtonColor)
            .roundedBorder(cornerRadius: acceptButtonCornerRadius, color: .clear)
            
            Button {
                inIgnore(handshakeId)
            } label: {
                Text("ignore")
                    .foregroundColor(ignoreButtonTextColor)
            }
            .frame(maxWidth: .infinity)
        }
        .font(buttonsFont)
    }
}

struct Accepted: View {
    private let infoTextColor = Color.black
    private let infoTextFont = Font.custom("Helvetica", size: 14)
    
    var body: some View {
        let iconSize = CGFloat(22)
        
        HStack(alignment: .top) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: iconSize, height: iconSize)
            
            Text("requestAccepted")
                .fontWeight(.medium)
        }
        .font(infoTextFont)
        .foregroundColor(infoTextColor)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 12)
    }
}

struct Ignored: View {
    private let infoTextFont = Font.custom("Helvetica", size: 14)
    
    var body: some View {
        Text("requestIgnored")
            .font(infoTextFont)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 14)
    }
}

struct BottomCardRow_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardRow(state: .pending)
    }
}
