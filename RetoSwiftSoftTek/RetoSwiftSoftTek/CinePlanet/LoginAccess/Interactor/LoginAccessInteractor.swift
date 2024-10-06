//
//  LoginAccessInteractor.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import CoreData

class LoginAccessInteractor: LoginAccessInteractorProtocol {
    
    // MARK: - PROPERTIES
    let coreDataManager: CoreDataManager
    
    // MARK: - CONSTRUCTOR
    init(
        coreDataManager: CoreDataManager = .shared
    ) {
        self.coreDataManager = coreDataManager
    }
    
    // MARK: - FUNCTIONS
    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void) {
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
//
//        do {
//            let users = try coreDataManager.context.fetch(fetchRequest)
//            completion(!users.isEmpty)
//        } catch {
//            print("Error fetching user: \(error)")
//            completion(false)
//        }
    }
    
}

