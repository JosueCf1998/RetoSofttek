//
//  APIServiceManagerProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

protocol APIServiceManagerProtocol {
    
    func listMovies(param: [QueryParams], completion: @escaping (Result<ListMoviesModelData, ErrorService>) -> Void)
    func searchMovies(param: [QueryParams], completion: @escaping (Result<ListMoviesModelData, ErrorService>) -> Void)
    
}
