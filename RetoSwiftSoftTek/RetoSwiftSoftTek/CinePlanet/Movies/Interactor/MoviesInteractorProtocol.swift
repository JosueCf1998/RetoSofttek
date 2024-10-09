//
//  MoviesInteractorProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesInteractorProtocol {
    
    // MARK: - FUNCTIONS
    func getListMovies(param: String, completion: @escaping (Result<(ListMoviesModel, [MovieDetailModel]), ErrorService>) -> Void)
    func getSearchMovies(query: String, page: String, completion: @escaping (Result<(ListMoviesModel, [MovieDetailModel]), ErrorService>) -> Void)
    
    func getListMoviesMemory(completion: @escaping(Result<[MovieDetailModel], ErrorService>) -> Void)
    func getSaveMovieMemory(_ request: MovieDetailModel, completion: @escaping(Result<Void, ErrorService>) -> Void)
    func getDeleteMovieMemory(_ index: Int, completion: @escaping (Result<Void, ErrorService>) -> Void)
    func getDeleteAllMoviesMemory(completion: @escaping (Result<Void, ErrorService>) -> Void)
    
}

