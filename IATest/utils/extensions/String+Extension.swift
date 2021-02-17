//
//  String+Extension.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "\(self)", comment: "\(self)")
    }
    
    public func localized(with arguments: [CVarArg]) -> String {
        return String(format: self.localized, locale: nil, arguments: arguments)
    }
}
