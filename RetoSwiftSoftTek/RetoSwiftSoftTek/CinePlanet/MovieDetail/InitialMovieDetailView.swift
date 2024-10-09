//
//  InitialMovieDetailView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import SwiftUI

struct InitialMovieDetailView: View {
    
    // MARK: - PROPERTIES
    @Binding var returnLogin: Bool
    var movie: ListMovieModel
    
    // MARK: - PROPERTIES
    init(
        returnLogin: Binding<Bool>,
        movie: ListMovieModel
    ) {
        self._returnLogin = returnLogin
        self.movie = movie
    }
    
    // MARK: - PROPERTIES
    var body: some View {
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(movie: movie, interactor: interactor, router: router)
        MovieDetailView(presenter: presenter, returnLogin: $returnLogin)
    }
    
}
