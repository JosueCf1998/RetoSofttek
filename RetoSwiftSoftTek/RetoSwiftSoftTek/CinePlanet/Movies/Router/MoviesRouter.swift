//
//  MoviesRouter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class MoviesRouter {
    
    // MARK: - CONSTRUCTOR
    init() {}
    
    // MARK: - CONSTRUCTOR
    func makeMovieDetailView(for movie: Movie) -> any MovieDetailPresenterProtocol {
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(movie: movie, interactor: interactor, router: MovieDetailRouter())
        return presenter
    }
    
}

