//
//  MoviesPresenterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesPresenterProtocol: ObservableObject {
    
    // MARK: - PROPERTIES
    var inputSearch: String { get set }
    var listMovies: [MovieDetailModel] { get set }
    var selectedMovie: MovieDetailModel? { get set }
    
    var isNavigating: Bool { get set }
    
    // MARK: - FUNCTIONS
    func validateMovieDetail(_ item: MovieDetailModel)
    
    func getListMovies()
    func fetchMovies()
    func saveMovie()
    func deleteAllMovies()
    
}
