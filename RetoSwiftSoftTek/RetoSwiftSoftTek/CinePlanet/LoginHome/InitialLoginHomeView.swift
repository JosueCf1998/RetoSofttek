//
//  InitialLoginHomeView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import SwiftUI

struct InitialLoginHomeView: View {
    
    // MARK: - PROPERTIES
    @Binding var returnLogin: Bool
    
    // MARK: - PROPERTIES
    init(
        returnLogin: Binding<Bool>
    ) {
        self._returnLogin = returnLogin
    }
    
    // MARK: - PROPERTIES
    var body: some View {
        let interactor = LoginHomeInteractor()
        let router = LoginHomeRouter()
        let presenter = LoginHomePresenter(interactor: interactor, router: router)
        LoginHomeView(presenter: presenter, returnLogin: $returnLogin)
    }
    
}
