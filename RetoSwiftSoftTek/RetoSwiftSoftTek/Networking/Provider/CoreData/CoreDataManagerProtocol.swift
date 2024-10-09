//
//  CoreDataManagerProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 7/10/24.
//

import Foundation

protocol CoreDataManagerProtocol {
    
    // MARK: - FUNCTIONS
    func saveMovie(request: MovieModel, completion: @escaping(Result<Void, ErrorService>) -> Void)
    func getAllListMovies(completion: @escaping(Result<[ListMovies], ErrorService>) -> Void)
    func deleteAllMovies(completion: @escaping(Result<Void, ErrorService>) -> Void)
    
    func saveLisMoviesMock(completion: @escaping(Result<Void, ErrorService>) -> Void)
    
}
