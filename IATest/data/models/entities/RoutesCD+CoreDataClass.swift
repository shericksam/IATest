//
//  RoutesCD+CoreDataClass.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import Foundation
import CoreData

@objc(RoutesCD)
public class RoutesCD: NSManagedObject, Codable {
    @nonobjc public class func fetchRequestAll() -> NSFetchRequest<RoutesCD> {
        let request = NSFetchRequest<RoutesCD>(entityName: "RoutesCD")
        request.sortDescriptors = [NSSortDescriptor(key: "code", ascending: true)]
        return request
    }
    
    enum CodingKeys: String, CodingKey {
        case code, sizes
    }
    
    required convenience public init(from decoder: Decoder) throws {
        if let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
           let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
           let entity = NSEntityDescription.entity(forEntityName: "RoutesCD", in: managedObjectContext)  {
            self.init(entity: entity, insertInto: managedObjectContext)
        }else {
            self.init()
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.sizes = try container.decodeIfPresent(SizeCD.self, forKey: .sizes)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(code, forKey: .code)
        try container.encode(sizes, forKey: .sizes)
    }
}
