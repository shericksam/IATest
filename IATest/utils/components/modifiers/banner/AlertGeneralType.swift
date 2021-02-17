//
//  
//  AlertGeneralType.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//
//

import Foundation
import SwiftUI

enum AlertGeneralType: String {
    case normal
    case danger
    case warning
    case success
    case info
    
    var colorType: Color {
        switch self {
            case .danger:
                return Color.danger
            case .normal:
                return Color.primaryColor
            case .success:
                return Color.success
            case .warning:
                return Color.warning
            case .info:
                return Color.info
        }
    }
}
