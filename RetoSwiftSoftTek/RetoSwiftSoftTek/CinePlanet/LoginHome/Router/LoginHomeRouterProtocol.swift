//
//  LoginHomeRouterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

protocol LoginHomeRouterProtocol: ObservableObject {
    
    // MARK: - FUNCTIONS
    func makeMoviesView() -> any LoginHomePresenterProtocol
    
}
