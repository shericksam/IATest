//
//  NSManagedObjectContext+Extensions.swift
//  HotCoffeeApp
//
//  Created by Mohammad Azam on 7/31/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct MyCoreBack {
    static let shared = MyCoreBack()
    
    var background: NSManagedObjectContext
    var main: NSManagedObjectContext
    
    init() {
        let viewContext = PersistenceController.shared.container.viewContext
        viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        viewContext.undoManager = nil
        self.main = viewContext
        let childContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        childContext.parent = viewContext
        childContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        childContext.undoManager = nil
        childContext.automaticallyMergesChangesFromParent = true
        self.background = childContext
    }
    
}

extension NSManagedObjectContext {
    
    static var main: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
    
    static var background: NSManagedObjectContext {
        return MyCoreBack.shared.background
    }
    
    func saveIfNeeded() {
        guard hasChanges else {
            print("no changes")
            return
        }
        performAndWait {
            do {
                // Saves the data from the child to the main context
                try save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
}
