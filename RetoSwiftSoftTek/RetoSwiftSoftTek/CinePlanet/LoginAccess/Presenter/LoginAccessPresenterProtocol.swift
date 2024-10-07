//
//  LoginAccessPresenterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

protocol LoginAccessPresenterProtocol: ObservableObject {
    
    // MARK: - PROPERTIES
    var isNavigating: Bool { get set }
    
    // MARK: - FUNCTIONS
    func navigateToLoginHome() -> any LoginHomePresenterProtocol
    
}
