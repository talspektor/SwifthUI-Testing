//
//  Post.swift
//  ScrollViewrefreshable (iOS)
//
//  Created by Tal Spektor on 17/09/2022.
//

import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
