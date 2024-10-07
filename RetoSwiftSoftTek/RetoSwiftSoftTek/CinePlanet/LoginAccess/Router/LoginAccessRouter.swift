//
//  LoginAccessRouter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class LoginAccessRouter: LoginAccessRouterProtocol {
    
    // MARK: - CONSTRUCTOR
    init() {}
    
    // MARK: - FUNCTIONS
    func getValuesLoginHome() -> any LoginHomePresenterProtocol {
        let interactor = LoginHomeInteractor()
        let router = LoginHomeRouter()
        let presenter = LoginHomePresenter(interactor: interactor, router: router)
        return presenter
    }
    
}
