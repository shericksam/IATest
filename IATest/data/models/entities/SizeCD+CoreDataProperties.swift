//
//  SizeCD+CoreDataProperties.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData


extension SizeCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SizeCD> {
        return NSFetchRequest<SizeCD>(entityName: "SizeCD")
    }

    @NSManaged public var large: String?
    @NSManaged public var medium: String?
    @NSManaged public var small: String?
    @NSManaged public var xLarge: String?
    @NSManaged public var route: NSSet?

}

// MARK: Generated accessors for route
extension SizeCD {

    @objc(addRouteObject:)
    @NSManaged public func addToRoute(_ value: RoutesCD)

    @objc(removeRouteObject:)
    @NSManaged public func removeFromRoute(_ value: RoutesCD)

    @objc(addRoute:)
    @NSManaged public func addToRoute(_ values: NSSet)

    @objc(removeRoute:)
    @NSManaged public func removeFromRoute(_ values: NSSet)

}

extension SizeCD : Identifiable {

}
