//
//  CoreDataManager.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 7/10/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK: - PROPERTIES
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - CONSTRUCTOR
    private init() {
        persistentContainer = NSPersistentContainer(name: "CineAppModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                 fatalError("Error initailizing CoreData \(error)")
            }
        }
    }
    
}

// MARK: - EXTENSION
extension CoreDataManager: CoreDataManagerProtocol {
    
    func listMoviesMemory(completion: @escaping(Result<[ListMovies], ErrorService>) -> Void) {
        let request: NSFetchRequest<ListMovies> = ListMovies.fetchRequest()
        do {
            let response = try viewContext.fetch(request)
            completion(.success(response))
        } catch {
            let error = ErrorService(code: "102", message: error.localizedDescription)
            completion(.failure(error))
        }
    }
    
    func saveMovieMemory(request: ListMovies, completion: @escaping(Result<Void, ErrorService>) -> Void) {
        do {
            try viewContext.save()
            completion(.success(()))
        } catch {
            viewContext.rollback()
            let error = ErrorService(code: "102", message: error.localizedDescription)
            completion(.failure(error))
        }
    }
    
    func getListMoviesId(id: NSManagedObjectID) -> ListMovies? {
        do {
            return try viewContext.existingObject(with: id) as? ListMovies
        } catch {
            return nil
        }
    }
    
    func deleteAllMovies(completion: @escaping(Result<Void, ErrorService>) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListMovies")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                viewContext.delete(objectData)
                completion(.success(()))
            }
        } catch {
            let error = ErrorService(code: "102", message: error.localizedDescription)
            completion(.failure(error))
        }
    }
    
    func deleteMovie(_ index : Int, completion: @escaping(Result<Void, ErrorService>) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListMovies")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for (id,item) in results.enumerated() {
                if index == id {
                    guard let objectData = item as? NSManagedObject else {continue}
                    viewContext.delete(objectData)
                    completion(.success(()))
                }
            }
        } catch {
            let error = ErrorService(code: "102", message: error.localizedDescription)
            completion(.failure(error))
        }
    }
    
    func saveLisMoviesMock(completion: @escaping(Result<Void, ErrorService>) -> Void) {
//        getAllListMovies { result in
//            
//        }
//        for number in 1...20 {
//            do {
//                let task = ListMovies(context: CoreDataManager.shared.viewContext)
//                task.title = "spiderman \(number)"
//                task.image = "background-spiderman"
//                try viewContext.save()
//                completion(.success(()))
//            } catch {
//                viewContext.rollback()
//                let error = ErrorService(code: "102", message: error.localizedDescription)
//                completion(.failure(error))
//            }
//        }
    }
    
}
