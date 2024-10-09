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
    
    @Published var listMovies: [MovieDetailModel] = []
//    @Published var listMovies: [ListMovieModel] = []
    @Published var selectedMovie: MovieDetailModel? = nil
    @Published var isNavigating: Bool = false
    @Published var inputSearch: String = ""
    
    // MARK: - CONSTRUCTOR
    init(
        interactor: MoviesInteractor,
        router: MoviesRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - FUNCTIONS
    
}

// MARK: - EXTENSION
extension MoviesPresenter {
    
    func getListMovies() {
        interactor.getListMovies { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let list, let detail):
                    print(detail.count)
                    self.listMovies = detail
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func fetchMovies() {
        interactor.getAllListMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
//                    self?.listMovies = response
                    break
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func saveMovie() {
        let request = MovieModel(
            title: "",
            image: "",
            note: "",
            date: "",
            resume: ""
        )
        interactor.saveMovie(request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("se guardo")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func deleteAllMovies() {
        interactor.deleteAllMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("se elimino todos")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func validateMovieDetail(_ item: MovieDetailModel) {
        selectedMovie = item
        isNavigating = true
    }
    
}
