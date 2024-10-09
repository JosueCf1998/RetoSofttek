//
//  MovieDetailPresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    // MARK: - PROPERTIES
    private let interactor: MovieDetailInteractor
    private let router: MovieDetailRouter
    
    @Published var movie: ListMovieModel
    @Published var isNavigating: Bool = false
    
    // MARK: - CONSTRUCTOR
    init(
        movie: ListMovieModel,
        interactor: MovieDetailInteractor,
        router: MovieDetailRouter
    ) {
        self.movie = movie
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - FUNCTIONS
    
    
}
