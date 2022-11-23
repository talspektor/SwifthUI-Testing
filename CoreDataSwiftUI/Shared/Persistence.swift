//
//  Persistence.swift
//  CoreDataSwiftUI
//
//  Created by Tal Spektor on 30/08/2022.
//

import CoreData
import CloudKit

struct PersistenceController {
    static let shared = PersistenceController()
    
    let conteiner: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        conteiner = NSPersistentCloudKitContainer(name: "CoreDataSwiftUI")
        if inMemory {
            conteiner.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        conteiner.viewContext.automaticallyMergesChangesFromParent = true
        conteiner.loadPersistentStores { storeDescription, err in
            if let err = err {
                fatalError(err.localizedDescription)
            }
        }
    }
    
    func save() throws {
        let context = conteiner.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
    
    func delete(_ object: NSManagedObject) throws {
        let context = conteiner.viewContext
        context.delete(object)
        try save()
    }
}
