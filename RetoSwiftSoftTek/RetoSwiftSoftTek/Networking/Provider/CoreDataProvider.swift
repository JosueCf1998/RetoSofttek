//
//  CoreDataProvider.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CinePlanetCoreData")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Error initailizing CoreData \(error)")
            }
        }
    }
    
}

