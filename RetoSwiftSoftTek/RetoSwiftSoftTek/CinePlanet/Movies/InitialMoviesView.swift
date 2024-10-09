//
//  InitialMoviesView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import SwiftUI

struct InitialMoviesView: View {
    
    // MARK: - PROPERTIES
    @Binding var returnLogin: Bool
    
    // MARK: - PROPERTIES
    init(
        returnLogin: Binding<Bool>
    ) {
        self._returnLogin = returnLogin
    }
    
    // MARK: - PROPERTIES
    var body: some View {
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        let presenter = MoviesPresenter(interactor: interactor, router: router)
        MoviesView(presenter: presenter, returnLogin: $returnLogin)
    }
    
}
