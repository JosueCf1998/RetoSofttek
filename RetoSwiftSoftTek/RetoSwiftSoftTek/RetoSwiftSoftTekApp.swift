//
//  RetoSwiftSoftTekApp.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 5/10/24.
//

import SwiftUI

@main
struct RetoSwiftSoftTekApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
