//
//  DetailView.swift
//  SwiftUI4PublishedFix
//
//  Created by Tal Spektor on 30/08/2022.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            viewModel.isPresented.toggle()
        } label: {
            Text("Dismiss")
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
