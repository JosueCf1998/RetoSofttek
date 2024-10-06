//
//  MainContentView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 5/10/24.
//

import SwiftUI
import CoreData

@main
struct MainContentView: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                let interactor = LoginInteractor()
                let router = LoginRouter()
                let presenter = LoginPresenter(interactor: interactor, router: router)
                LoginView(presenter: presenter)
            }
        }
    }
}
