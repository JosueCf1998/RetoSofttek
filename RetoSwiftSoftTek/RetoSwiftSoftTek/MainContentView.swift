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
                let interactor = LoginAccessInteractor()
                let router = LoginAccessRouter()
                let presenter = LoginAccessPresenter(interactor: interactor, router: router)
                LoginAccessView(presenter: presenter)
                    .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
            }
        }
    }
}
