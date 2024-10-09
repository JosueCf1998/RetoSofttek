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
    let providerCore: CoreDataManagerProtocol
    let providerApi: APIServiceManagerProtocol
    
    // MARK: - CONSTRUCTOR
    init(
        providerCore: CoreDataManagerProtocol = CoreDataManager.shared,
        providerApi: APIServiceManagerProtocol = APIServiceManager()
    ) {
        self.providerCore = providerCore
        self.providerApi = providerApi
    }
    
}

extension MoviesInteractor: MoviesInteractorProtocol {
    
    // MARK: - SECTION API SERVICE
    func getListMovies(completion: @escaping (Result<(ListMoviesModel, [MovieDetailModel]), ErrorService>) -> Void) {
        providerApi.listMovies { result in
            switch result {
            case .success(let response):
                let list = ListMoviesModel.convert(response)
                let detail = MovieDetailModel.convertList(response.results)
                completion(.success((list, detail)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - SECTION CORE DATA
    func getAllListMovies(completion: @escaping (Result<[ListMovieModel], ErrorService>) -> Void) {
        providerCore.getAllListMovies { result in
            switch result {
            case .success(let response):
                let data = ListMovieModel.convertList(response)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func saveMovie(_ request: MovieModel, completion: @escaping (Result<Void, ErrorService>) -> Void) {
        providerCore.saveMovie(request: request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteAllMovies(completion: @escaping (Result<Void, ErrorService>) -> Void) {
        providerCore.deleteAllMovies { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

