//
//  MoviesPresenterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MoviesPresenterProtocol: ObservableObject {
    
    // MARK: - PROPERTIES
    var userName: String { get set }
    var password: String { get set }
    var isNavigating: Bool { get set }
    
    // MARK: - FUNCTIONS
    func validateCredentials()
    func navigateToMovies() -> MovieDetailPresenterProtocol
    
}
