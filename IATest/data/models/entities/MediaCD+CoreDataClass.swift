//
//  MediaCD+CoreDataClass.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData

@objc(MediaCD)
public class MediaCD: NSManagedObject, Codable {
    @nonobjc public class func fetchRequestAll() -> NSFetchRequest<MediaCD> {
        let request = NSFetchRequest<MediaCD>(entityName: "MediaCD")
        request.sortDescriptors = [NSSortDescriptor(key: "code", ascending: true)]
        return request
    }
    
    enum CodingKeys: String, CodingKey {
        case type, code, resource
    }
    
    required convenience public init(from decoder: Decoder) throws {
        if let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
           let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
           let entity = NSEntityDescription.entity(forEntityName: "MediaCD", in: managedObjectContext)  {
            self.init(entity: entity, insertInto: managedObjectContext)
        }else {
            self.init()
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.resource = try container.decodeIfPresent(String.self, forKey: .resource)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(code, forKey: .code)
        try container.encode(type, forKey: .type)
        try container.encode(resource, forKey: .resource)
    }
}
