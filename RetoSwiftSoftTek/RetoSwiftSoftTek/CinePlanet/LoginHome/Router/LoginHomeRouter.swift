//
//  LoginHomeRouter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class LoginHomeRouter: LoginHomeRouterProtocol {
    
    // MARK: - FUNCTIONS
    func makeMoviesView() -> any LoginHomePresenterProtocol {
//        let interactor = MoviesInteractor()
//        let presenter = MoviesPresenter(interactor: interactor, router: MoviesRouter())
//        return MoviesView(presenter: presenter)
        return LoginHomePresenter()
    }
    
}
