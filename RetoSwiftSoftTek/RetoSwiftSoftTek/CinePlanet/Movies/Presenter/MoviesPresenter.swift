//
//  MoviesPresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

class MoviesPresenter: MoviesPresenterProtocol {
    
    // MARK: - PROPERTIES
    private let interactor: MoviesInteractor
    private let router: MoviesRouter
    
    @Published var movies: [Movie] = []
    @Published var isNavigating: Bool = false
    
    // MARK: - CONSTRUCTOR
    init(
        interactor: MoviesInteractor,
        router: MoviesRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - FUNCTIONS
    func fetchMovies() {
//        interactor.fetchMovies { [weak self] movies in
//            DispatchQueue.main.async {
//                self?.movies = movies
//            }
//        }
    }
    
    func navigateToMovieDetail(for movie: Movie) -> any MovieDetailPresenterProtocol {
        return router.getValuesMoviesDetail(for: movie)
    }
    
}
