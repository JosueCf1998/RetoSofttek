//
//  MoviesInteractor.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import CoreData

class MoviesInteractor {
    
    // MARK: - PROPERTIES
    let coreDataManager: CoreDataManager
    
    // MARK: - CONSTRUCTOR
    init(
        coreDataManager: CoreDataManager = .shared
    ) {
        self.coreDataManager = coreDataManager
    }
    
    // MARK: - PROPERTIES
    func fetchMovies(completion: @escaping ([Movie]) -> Void) {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            let movies = try coreDataManager.context.fetch(fetchRequest)
            completion(movies)
        } catch {
            print("Error fetching movies: \(error)")
            completion([])
        }
    }
    
}

