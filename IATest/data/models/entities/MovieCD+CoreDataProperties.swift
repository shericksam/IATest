//
//  MovieCD+CoreDataProperties.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData


extension MovieCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieCD> {
        return NSFetchRequest<MovieCD>(entityName: "MovieCD")
    }

    @NSManaged public var categories: [String]?
    @NSManaged public var cinemas: [String]?
    @NSManaged public var code: String?
    @NSManaged public var genre: String?
    @NSManaged public var id: Int32
    @NSManaged public var length: String?
    @NSManaged public var name: String?
    @NSManaged public var originalName: String?
    @NSManaged public var position: Int16
    @NSManaged public var rating: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var synopsis: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var media: NSSet?

}

// MARK: Generated accessors for media
extension MovieCD {

    @objc(addMediaObject:)
    @NSManaged public func addToMedia(_ value: MediaCD)

    @objc(removeMediaObject:)
    @NSManaged public func removeFromMedia(_ value: MediaCD)

    @objc(addMedia:)
    @NSManaged public func addToMedia(_ values: NSSet)

    @objc(removeMedia:)
    @NSManaged public func removeFromMedia(_ values: NSSet)

}

extension MovieCD : Identifiable {

}
