//
//  APIServiceManagerProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

protocol APIServiceManagerProtocol {
    
    func listMovies(completion: @escaping (Result<ListMoviesModelData, ErrorService>) -> Void)
    
}
