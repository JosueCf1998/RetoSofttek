//
//  LoginAccessView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

struct LoginAccessView<Presenter: LoginAccessPresenterProtocol>: View {
    
    // MARK: - PROPERTIES
    @StateObject private var presenter: Presenter
    
    // MARK: - CONSTRUCTOR
    init(
        presenter: Presenter
    ) {
        self._presenter = StateObject(wrappedValue: presenter)
    }
    
    // MARK: - CONTENT BODY
    var body: some View {
        NavigationStack {
            ZStack() {
                Color.black
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                    }
                VStack {
                }
            }
        }
    }
    
}

//
//#Preview {
//    LoginAccessView(presenter: LoginPresenter(interactor: LoginInteractor(), router: LoginRouter()))
//}
