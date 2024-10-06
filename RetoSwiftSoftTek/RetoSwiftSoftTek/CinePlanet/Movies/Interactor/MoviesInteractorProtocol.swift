//
//  MoviesInteractorProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesInteractorProtocol {
    
    // MARK: - FUNCTIONS
    func fetchMovies(completion: @escaping ([Movie]) -> Void)
    
}

