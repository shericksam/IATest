//
//  Color+Extension.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import Foundation
import SwiftUI

extension Color {
    static let oldPrimaryColor = Color(UIColor.systemIndigo)

    static let primaryColor = Color("primary")
    static let secondaryColor = Color("secondary")
    static let tertiary = Color("tertiary")
    static let success = Color("success")
    static let warning = Color("warning")
    static let danger = Color("danger")
    static let info = Color("info")
    static let dark = Color("dark")
    static let medium = Color("medium")
    static let greenTheme = Color("greenTheme")
    static let darkGray = Color("darkGray")
    static let grayLight = Color("grayLight")
    static let whiteColor = Color("whiteColor")
    static let blackColor = Color("blackColor")
    static let yellowStar = Color("yellowStar")
    static let blueColor = Color("blueColor")
    
    
    
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
    
    static func randomHex() -> String {
        let characters = "0123456789ABCDEF"
        return "" + (0..<6).map({ _ in characters.randomElement()! })
    }
    
    init(hex: String) {
        var hex = hex.replacingOccurrences(of: "#", with: "")
        hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
