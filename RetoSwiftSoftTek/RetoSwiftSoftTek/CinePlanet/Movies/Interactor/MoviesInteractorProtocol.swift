//
//  MoviesInteractorProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesInteractorProtocol {
    
    // MARK: - FUNCTIONS
    func getAllListMovies(completion: @escaping(Result<[ListMovieModel], ErrorService>) -> Void)
    func saveMovie(_ request: MovieModel, completion: @escaping(Result<Void, ErrorService>) -> Void)
    func deleteAllMovies(completion: @escaping (Result<Void, ErrorService>) -> Void)
    
}

