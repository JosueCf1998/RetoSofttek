//
//  LoginHomePresenterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol LoginHomePresenterProtocol: ObservableObject {
    
    // MARK: - PROPERTIES
    var userName: TextFieldCustomModel { get set }
    var password: TextFieldCustomModel { get set }
    var isNavigating: Bool { get set }
    
    // MARK: - FUNCTIONS
    func validateCredentials()
    func navigateToMovies() -> any MoviesPresenterProtocol
    
}
