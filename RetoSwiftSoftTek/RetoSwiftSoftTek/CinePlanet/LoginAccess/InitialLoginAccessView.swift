//
//  InitialLoginAccessView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import SwiftUI

struct InitialLoginAccessView: View {
    
    // MARK: - CONTENT BODY
    var body: some View {
        let interactor = LoginAccessInteractor()
        let router = LoginAccessRouter()
        let presenter = LoginAccessPresenter(interactor: interactor, router: router)
        LoginAccessView(presenter: presenter)
    }
    
}
