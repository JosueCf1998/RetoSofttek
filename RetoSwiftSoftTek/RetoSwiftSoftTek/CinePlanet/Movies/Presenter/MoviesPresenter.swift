//
//  MoviesPresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

class MoviesPresenter: MoviesPresenterProtocol {
    
    // MARK: - PROPERTIES
    private let interactor: MoviesInteractorProtocol
    private let router: MoviesRouterProtocol
    
    @Published var listMovies: [MovieDetailModel] = []
    @Published var recentMovies: [MovieDetailModel] = []
    @Published var searchMovies: [MovieDetailModel] = []
    @Published var selectedMovie: MovieDetailModel? = nil
    @Published var inputSearch: String = ""
    
    @Published var isNavigating: Bool = false
    @Published var isShowingError: Bool = false
    
    var emptyList: Bool = false
    var newPage: Int = 0
    
    // MARK: - CONSTRUCTOR
    init(
        interactor: MoviesInteractorProtocol,
        router: MoviesRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - FUNCTIONS
    func validateMovieDetail(_ item: MovieDetailModel) {
        selectedMovie = item
        isNavigating = true
    }
    
    func validateMovieDetailMemory(_ item: MovieDetailModel) {
        selectedMovie = item
        getSaveMovieMemory()
        self.isNavigating = true
    }
    
}

// MARK: - EXTENSION
extension MoviesPresenter {
    
    func getListMovies() {
        if emptyList {
            return
        }
        newPage += 1
        interactor.getListMovies(param: "\(newPage)") { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success((_, let detail)):
                    if detail.count == 0 {
                        self.emptyList = true
                    }
                    self.listMovies += detail
                case .failure(_):
                    self.isShowingError = true
                }
            }
        }
    }
    
    func getSearchMovies() {
        var query = inputSearch
        var page = "1"
        interactor.getSearchMovies(query: query, page: page) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success((let list, let detail)):
                    self.searchMovies = detail
                case .failure(_):
                    self.isShowingError = true
                }
            }
        }
    }
    
    func getListMoviesMemory() {
        interactor.getListMoviesMemory { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.recentMovies = response
                case .failure(_):
                    self.isShowingError = true
                }
            }
        }
    }
    
    func getSaveMovieMemory() {
        if let request = selectedMovie {
            interactor.getSaveMovieMemory(request) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        self.getListMoviesMemory()
                    case .failure(_):
                        self.isShowingError = true
                    }
                }
            }
        }
    }
    
    func getDeleteAllMoviesMemory() {
        interactor.getDeleteAllMoviesMemory { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.getListMoviesMemory()
                case .failure(_):
                    self.isShowingError = true
                }
            }
        }
    }
    
    func getDeleteMovieMemory(_ index: Int) {
        interactor.getDeleteMovieMemory(index) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.getListMoviesMemory()
                case .failure(_):
                    self.isShowingError = true
                }
            }
        }
    }
    
}
