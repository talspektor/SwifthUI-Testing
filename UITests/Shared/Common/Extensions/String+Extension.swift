//
//  String+Extension.swift
//  UITests
//
//  Created by Tal Spektor on 26/09/2022.
//

import Foundation
import UIKit

extension String {
    func getWidth(forFont fontName: String = "Helvetica", size: CGFloat) -> CGFloat {
        let font = UIFont(name: fontName, size: size)
        let fontAttributed = [NSAttributedString.Key.font: font]
        let width = (self as NSString).size(withAttributes: fontAttributed as [NSAttributedString.Key : Any]).width
        return width
    }
}
