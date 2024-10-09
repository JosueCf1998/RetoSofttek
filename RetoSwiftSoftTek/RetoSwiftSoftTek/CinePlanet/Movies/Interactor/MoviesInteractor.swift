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
    func getListMovies(param: String, completion: @escaping (Result<(ListMoviesModel, [MovieDetailModel]), ErrorService>) -> Void) {
        let param = [
            QueryParams(key: "page", value: param),
            QueryParams(key: "language", value: Constants.language),
            QueryParams(key: "api_key", value: Constants.apiKey),
        ]
        providerApi.listMovies(param: param) { result in
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
    
    func getSearchMovies(query: String, page: String, completion: @escaping (Result<(ListMoviesModel, [MovieDetailModel]), ErrorService>) -> Void) {
        let param = [
            QueryParams(key: "query", value: query),
            QueryParams(key: "include_adult", value: Constants.includeAdult),
            QueryParams(key: "language", value: Constants.language),
            QueryParams(key: "page", value: page),
            QueryParams(key: "api_key", value: Constants.apiKey),
        ]
        providerApi.searchMovies(param: param) { result in
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
    func getListMoviesMemory(completion: @escaping (Result<[MovieDetailModel], ErrorService>) -> Void) {
        providerCore.listMoviesMemory { result in
            switch result {
            case .success(let response):
                let data = MovieDetailModel.convertMemory(response)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSaveMovieMemory(_ request: MovieDetailModel, completion: @escaping (Result<Void, ErrorService>) -> Void) {
        let requestList = MovieDetailModel.convertMemory(request)
        providerCore.saveMovieMemory(request: requestList) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getDeleteAllMoviesMemory(completion: @escaping (Result<Void, ErrorService>) -> Void) {
        providerCore.deleteAllMovies { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getDeleteMovieMemory(_ index: Int, completion: @escaping (Result<Void, ErrorService>) -> Void) {
        providerCore.deleteMovie(index) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

