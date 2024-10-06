//
//  LoginAccessRouter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

class LoginAccessRouter: LoginAccessRouterProtocol {
    
    // MARK: - FUNCTIONS
    func makeMoviesView() -> any LoginHomePresenterProtocol {
//        let interactor = MoviesInteractor()
//        let presenter = MoviesPresenter(interactor: interactor, router: MoviesRouter())
//        return MoviesView(presenter: presenter)
        return LoginHomePresenter()
    }
    
}
