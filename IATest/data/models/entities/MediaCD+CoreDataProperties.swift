//
//  MediaCD+CoreDataProperties.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData


extension MediaCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MediaCD> {
        return NSFetchRequest<MediaCD>(entityName: "MediaCD")
    }

    @NSManaged public var code: String?
    @NSManaged public var resource: String?
    @NSManaged public var type: String?
    @NSManaged public var movie: MovieCD?

}

extension MediaCD : Identifiable {

}
