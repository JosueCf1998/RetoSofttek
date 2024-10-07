//
//  LoginHomeRouter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class LoginHomeRouter: LoginHomeRouterProtocol {
    
    // MARK: - CONSTRUCTOR
    init() {}
    
    // MARK: - FUNCTIONS
    func getValuesMovie() -> any MoviesPresenterProtocol {
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        let presenter = MoviesPresenter(interactor: interactor, router: router)
        return presenter
    }
    
}
