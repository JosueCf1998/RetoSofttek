//
//  LoginHomePresenter.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

class LoginHomePresenter: LoginHomePresenterProtocol {
    
    // MARK: - PROPERTIES
    private let interactor: LoginHomeInteractorProtocol
    private let router: LoginHomeRouterProtocol
    
    @Published var userName: TextFieldCustomModel = TextFieldCustomModel(validation: .none, errorMessage: "", text: "")
    @Published var password: TextFieldCustomModel = TextFieldCustomModel(validation: .none, errorMessage: "", text: "")
    @Published var isNavigating: Bool = false
    
    var userNameCorrect = "admin"
    var passwordCorrect =  "password123"
    
    // MARK: - CONSTRUCTOR
    init(
        interactor: LoginHomeInteractorProtocol,
        router: LoginHomeRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - METHODS
    func validateCredentials() {
        let valUser = validateCredentialsUserName()
        let valPass = validateCredentialsPassword()
        if valUser == true && valPass == true {
            isNavigating = true
        } else {
            isNavigating = false
        }
    }
    
    func validateCredentialsUserName() -> Bool {
        if userName.text.isEmpty {
            userName.validation = .error
            userName.errorMessage = "Por favor, ingrese su nombre de usuario."
            return false
        } else if userName.text != userNameCorrect {
            userName.validation = .error
            userName.errorMessage = "Usuario ingresado es incorrecta"
            return false
        } else {
            return true
        }
    }
    
    func validateCredentialsPassword() -> Bool {
        if password.text.isEmpty {
            password.validation = .error
            password.errorMessage = "Por favor, ingrese su nombre de usuario."
            return false
        } else if password.text != passwordCorrect {
            password.validation = .error
            password.errorMessage = "Contraseña ingresada es incorrecta"
            return false
        } else {
            return true
        }
    }
    

    func navigateToMovies() -> any MoviesPresenterProtocol {
        return router.getValuesMovie()
    }
    
}
