//
//  LoginAccessPresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import SwiftUI

class LoginAccessPresenter: LoginAccessPresenterProtocol {
    
    // MARK: - PROPERTIES
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var isNavigating: Bool = false
    private let interactor: LoginInteractor
    private let router: LoginRouter
    
    // MARK: - CONSTRUCTOR
    init(
        interactor: LoginInteractor,
        router: LoginRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - METHODS
    func validateCredentials() {
        isNavigating = true
//        if username.isEmpty || password.isEmpty {
//            alertMessage = "Por favor, complete todos los campos."
//            showAlert = true
//        } else if username == "usuario" && password == "contraseña" {
//            alertMessage = "Inicio de sesión exitoso."
//            showAlert = true
//        } else {
//            alertMessage = "Nombre de usuario o contraseña incorrectos."
//            showAlert = true
//        }
    }

    func navigateToMovies() -> LoginHomePresenter {
        return router.makeMoviesView()
    }
}


