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
    private let interactor: LoginAccessInteractorProtocol
    private let router: LoginAccessRouterProtocol
    
    @Published var isNavigating: Bool = false
    
    // MARK: - CONSTRUCTOR
    init(
        interactor: LoginAccessInteractorProtocol,
        router: LoginAccessRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - FUNCTIONS
    
}


