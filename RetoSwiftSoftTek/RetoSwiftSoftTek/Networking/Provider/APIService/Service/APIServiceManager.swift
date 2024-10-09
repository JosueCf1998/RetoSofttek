//
//  APIServiceManager.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

class APIServiceManager: APIServiceManagerProtocol {
    
    // MARK: - FUNCTIONS
    func listMovies(completion: @escaping (Result<ListMoviesModelData, ErrorService>) -> Void) {
        let path = ServicePath.listMovie
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
                        print(response)
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
