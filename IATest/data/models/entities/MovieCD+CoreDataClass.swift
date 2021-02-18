//
//  MovieCD+CoreDataClass.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData

@objc(MovieCD)
public class MovieCD: NSManagedObject, Codable {
    @nonobjc public class func fetchRequestAll() -> NSFetchRequest<MovieCD> {
        let request = NSFetchRequest<MovieCD>(entityName: "MovieCD")
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        return request
    }
    
    enum CodingKeys: String, CodingKey {
        case rating, media, cinemas, position, categories, genre, synopsis, length
        case releaseDate = "release_date"
        case id, name, code
        case originalName = "original_name"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        if let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
           let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
           let entity = NSEntityDescription.entity(forEntityName: "MovieCD", in: managedObjectContext)  {
            self.init(entity: entity, insertInto: managedObjectContext)
        }else {
            self.init()
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.rating = try container.decodeIfPresent(String.self, forKey: .rating)
        self.media = try container.decodeIfPresent(Set<MediaCD>.self, forKey: .media) as NSSet?
//        self.cinemas = try container.decodeIfPresent([Int].self, forKey: .cinemas)
        self.position = try container.decodeIfPresent(Int16.self, forKey: .position) ?? 0
        self.categories = try container.decodeIfPresent([String].self, forKey: .categories)
        self.genre = try container.decodeIfPresent(String.self, forKey: .genre)
        self.length = try container.decodeIfPresent(String.self, forKey: .length)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.id = try container.decodeIfPresent(Int32.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.synopsis = try container.decodeIfPresent(String.self, forKey: .synopsis)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(rating, forKey: .rating)
        try container.encode(cinemas, forKey: .cinemas)
        try container.encode(position, forKey: .position)
        try container.encode(categories, forKey: .categories)
        try container.encode(genre, forKey: .genre)
        try container.encode(length, forKey: .length)
        try container.encode(releaseDate, forKey: .releaseDate)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(code, forKey: .code)
        try container.encode(originalName, forKey: .originalName)
    }
}
