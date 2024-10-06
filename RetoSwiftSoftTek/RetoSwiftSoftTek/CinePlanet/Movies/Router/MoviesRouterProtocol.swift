//
//  MoviesRouterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesRouterProtocol {
    
    // MARK: - FUNCTIONS
    func makeMovieDetailView(for movie: Movie) -> any MovieDetailPresenterProtocol
    
}
