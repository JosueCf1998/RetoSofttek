//
//  RetoSwiftSoftTekTests.swift
//  RetoSwiftSoftTekTests
//
//  Created by josue on 5/10/24.
//

import XCTest
@testable import RetoSwiftSoftTek

class MockMoviesInteractor: MoviesInteractorProtocol {
    
    var responseTypeSuccess: Bool
    
    init(
        _ responseTypeSuccess: Bool = true
    ) {
        self.responseTypeSuccess = responseTypeSuccess
    }
    
    func getListMovies(param: String, completion: @escaping (Result<(RetoSwiftSoftTek.ListMoviesModel, [RetoSwiftSoftTek.MovieDetailModel]), RetoSwiftSoftTek.ErrorService>) -> Void) {
        if responseTypeSuccess {
            let list = ListMoviesModel(page: 0, totalPages: 0, totalResults: 0)
            let detail = [
                MovieDetailModel(posterPath: "dummy", title: "dummy", voteAverage: 0.0, releaseDate: "dummy", overview: "dummy")
            ]
            completion(.success((list, detail)))
        } else {
            let newError = ErrorService(code: "dummy", title: "dummy", message: "dummy")
            completion(.failure(newError))
        }
    }
    
    func getSearchMovies(query: String, page: String, completion: @escaping (Result<(RetoSwiftSoftTek.ListMoviesModel, [RetoSwiftSoftTek.MovieDetailModel]), RetoSwiftSoftTek.ErrorService>) -> Void) {
        if responseTypeSuccess {
            let list = ListMoviesModel(page: 0, totalPages: 0, totalResults: 0)
            let detail = [
                MovieDetailModel(posterPath: "dummy", title: "dummy", voteAverage: 0.0, releaseDate: "dummy", overview: "dummy")
            ]
            completion(.success((list, detail)))
        } else {
            let newError = ErrorService(code: "dummy", title: "dummy", message: "dummy")
            completion(.failure(newError))
        }
    }
    
    func getListMoviesMemory(completion: @escaping (Result<[RetoSwiftSoftTek.MovieDetailModel], RetoSwiftSoftTek.ErrorService>) -> Void) {
        if responseTypeSuccess {
            let data = [
                MovieDetailModel(posterPath: "dummy", title: "dummy", voteAverage: 0.0, releaseDate: "dummy", overview: "dummy")
            ]
            completion(.success(data))
        } else {
            let newError = ErrorService(code: "dummy", title: "dummy", message: "dummy")
            completion(.failure(newError))
        }
    }
    
    func getSaveMovieMemory(_ request: RetoSwiftSoftTek.MovieDetailModel, completion: @escaping (Result<Void, RetoSwiftSoftTek.ErrorService>) -> Void) {
        if responseTypeSuccess {
            completion(.success(()))
        } else {
            let newError = ErrorService(code: "dummy", title: "dummy", message: "dummy")
            completion(.failure(newError))
        }
    }
    
    func getDeleteMovieMemory(_ index: Int, completion: @escaping (Result<Void, RetoSwiftSoftTek.ErrorService>) -> Void) {
        if responseTypeSuccess {
            completion(.success(()))
        } else {
            let newError = ErrorService(code: "dummy", title: "dummy", message: "dummy")
            completion(.failure(newError))
        }
    }
    
    func getDeleteAllMoviesMemory(completion: @escaping (Result<Void, RetoSwiftSoftTek.ErrorService>) -> Void) {
        if responseTypeSuccess {()
            completion(.success(()))
        } else {
            let newError = ErrorService(code: "dummy", title: "dummy", message: "dummy")
            completion(.failure(newError))
        }
    }

}
