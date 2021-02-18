//
//  
//  ArrayStringTransformer.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import Foundation

@objc(ArrayStringTransformer)
final class ArrayStringTransformer: NSSecureUnarchiveFromDataTransformer {
    
    static let name = NSValueTransformerName(rawValue: String(describing: [String].self))
    
    // Make sure `CustomClass` is in the allowed class list,
    // AND any other classes that are encoded in `CustomClass`
    override static var allowedTopLevelClasses: [AnyClass] {
        // for example... yours may look different
        return [NSString.self, NSArray.self, NSValue.self]
    }
    
    /// Registers the transformer.
    public static func register() {
        let transformer = ArrayStringTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
