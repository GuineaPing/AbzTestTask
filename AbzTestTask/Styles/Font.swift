//
//  Fonts.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

extension Font {
    static func customFont(size: CGFloat) -> Font {
        return Font.custom("Nunito Sans", size: size)
    }

    static let heading1 = customFont(size: 20)
    static let body1 = customFont(size: 16)
    static let body2 = customFont(size: 18)
    static let body3 = customFont(size: 14)
}
