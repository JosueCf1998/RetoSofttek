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
    var recentMovies: [MovieDetailModel] { get set }
    var searchMovies: [MovieDetailModel] { get set }
    var selectedMovie: MovieDetailModel? { get set }
    
    var emptyList: Bool { get set }
    
    var isNavigating: Bool { get set }
    var isShowingError: Bool { get set }
    
    // MARK: - FUNCTIONS
    func validateMovieDetail(_ item: MovieDetailModel)
    func validateMovieDetailMemory(_ item: MovieDetailModel)
    
    func getListMovies()
    func getSearchMovies()
    
    func getListMoviesMemory()
    func getSaveMovieMemory()
    func getDeleteMovieMemory(_ index: Int)
    func getDeleteAllMoviesMemory()
    
}
