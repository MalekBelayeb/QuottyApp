//
//  ViewUtils.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 20/1/2022.
//

import Foundation
import SwiftUI

extension Color {
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension Color
{
    
    static let lightBlueColor = Color.init(hex:0x7aacb3)
    static let pinkColor = lightBlueColor.opacity(0.5)

    static let buttonColor = Color.init(hex: 0x3b3759)
    static let cardQuoteColor = Color.init(hex: 0x4c6e81)
    
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
