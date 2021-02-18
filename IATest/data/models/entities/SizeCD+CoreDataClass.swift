//
//  SizeCD+CoreDataClass.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData

@objc(SizeCD)
public class SizeCD: NSManagedObject, Codable {
    @nonobjc public class func fetchRequestAll() -> NSFetchRequest<SizeCD> {
        let request = NSFetchRequest<SizeCD>(entityName: "SizeCD")
        request.sortDescriptors = [NSSortDescriptor(key: "code", ascending: true)]
        return request
    }
    
    enum CodingKeys: String, CodingKey {
        case large, medium, small
        case xLarge = "x-large"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        if let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
           let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
           let entity = NSEntityDescription.entity(forEntityName: "SizeCD", in: managedObjectContext)  {
            self.init(entity: entity, insertInto: managedObjectContext)
        }else {
            self.init()
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.large = try container.decodeIfPresent(String.self, forKey: .large)
        self.medium = try container.decodeIfPresent(String.self, forKey: .medium)
        self.small = try container.decodeIfPresent(String.self, forKey: .small)
        self.xLarge = try container.decodeIfPresent(String.self, forKey: .xLarge)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(large, forKey: .large)
        try container.encode(medium, forKey: .medium)
        try container.encode(small, forKey: .small)
        try container.encode(xLarge, forKey: .xLarge)
    }
}
