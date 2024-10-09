//
//  APIServiceManager.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

class APIServiceManager: APIServiceManagerProtocol {
    
    // MARK: - FUNCTIONS
    func listMovies(param: [QueryParams], completion: @escaping (Result<ListMoviesModelData, ErrorService>) -> Void) {
        let path = addQueryParams(ServicePath.listMovie, param)
        guard let url = URL(string: path) else {  return }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else { return }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(ListMoviesModelData.self, from: data)
                        completion(.success(response))
                    } catch {
                        let newError = ErrorService(code: "", title: "", message: error.localizedDescription)
                        completion(.failure(newError))
                    }
                }
            } else {
//                completion(.failure(IGError.codeError(httpResponse.statusCode)))
            }
        }
        task.resume()
    }
    
    func searchMovies(param: [QueryParams], completion: @escaping (Result<ListMoviesModelData, ErrorService>) -> Void) {
        let path = addQueryParams(ServicePath.searchMovie, param)
        guard let url = URL(string: path) else {  return }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else { return }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(ListMoviesModelData.self, from: data)
                        completion(.success(response))
                    } catch {
                        let newError = ErrorService(code: "", title: "", message: error.localizedDescription)
                        completion(.failure(newError))
                    }
                }
            } else {
//                completion(.failure(IGError.codeError(httpResponse.statusCode)))
            }
        }
        task.resume()
    }
    
}

extension APIServiceManager {
    
    func addQueryParams(_ path: String,_ queriesList: [QueryParams]) -> String {
        var newPath = "\(path)?"
        for (index,item) in queriesList.enumerated() {
            newPath += "\(item.key)=\(item.value)"
            if index + 1 != queriesList.count { newPath += "&"}
        }
        return newPath
    }
    
}
