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
    func getValuesMoviesDetail(for movie: Movie) -> any MovieDetailPresenterProtocol {
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(movie: movie, interactor: interactor, router: router)
        return presenter
    }
    
}

