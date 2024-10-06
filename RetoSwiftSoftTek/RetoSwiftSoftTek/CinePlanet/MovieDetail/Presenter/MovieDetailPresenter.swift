//
//  MovieDetailPresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    // MARK: - PROPERTIES
    @Published var movie: Movie
    
    private let interactor: MovieDetailInteractor
    private let router: MovieDetailRouter
    
    // MARK: - CONSTRUCTOR
    init(
        movie: Movie,
        interactor: MovieDetailInteractor,
        router: MovieDetailRouter
    ) {
        self.movie = movie
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - FUNCTIONS
    
    
}
