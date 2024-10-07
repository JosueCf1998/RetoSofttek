//
//  MoviesPresenterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesPresenterProtocol: ObservableObject {
    
    // MARK: - PROPERTIES
    var movies: [Movie] { get set }
    var isNavigating: Bool { get set }
    
    // MARK: - FUNCTIONS
    func fetchMovies()
    func navigateToMovieDetail(for movie: Movie) -> any MovieDetailPresenterProtocol
    
}
