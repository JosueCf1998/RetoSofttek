//
//  CoreDataManagerProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 7/10/24.
//

import Foundation

protocol CoreDataManagerProtocol {
    
    // MARK: - FUNCTIONS
    func listMoviesMemory(completion: @escaping(Result<[ListMovies], ErrorService>) -> Void)
    func saveMovieMemory(request: ListMovies, completion: @escaping(Result<Void, ErrorService>) -> Void)
    func deleteMovie(_ index : Int, completion: @escaping(Result<Void, ErrorService>) -> Void)
    func deleteAllMovies(completion: @escaping(Result<Void, ErrorService>) -> Void)
    
    func saveLisMoviesMock(completion: @escaping(Result<Void, ErrorService>) -> Void)
    
}
