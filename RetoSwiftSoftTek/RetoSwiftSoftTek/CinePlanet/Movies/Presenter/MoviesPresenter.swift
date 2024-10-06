//
//  MoviesPresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

class MoviesPresenter: MoviesPresenterProtocol {
    
    // MARK: - PROPERTIES
    @Published var movies: [Movie] = []
    private let interactor: MoviesInteractor
    private let router: MoviesRouter
    
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
        interactor.fetchMovies { [weak self] movies in
            DispatchQueue.main.async {
                self?.movies = movies
            }
        }
    }
    
    func navigateToMovieDetail(for movie: Movie) -> some View {
        return router.makeMovieDetailView(for: movie)
    }
    
}
