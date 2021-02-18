//
//  RoutesCD+CoreDataProperties.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData


extension RoutesCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoutesCD> {
        return NSFetchRequest<RoutesCD>(entityName: "RoutesCD")
    }

    @NSManaged public var code: String?
    @NSManaged public var sizes: SizeCD?

}

extension RoutesCD : Identifiable {

}
