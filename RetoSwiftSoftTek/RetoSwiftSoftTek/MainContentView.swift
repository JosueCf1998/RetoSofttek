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
    
    // MARK: - PROPERTIES
//    let persistenceController = CoreDataManager.shared
    @State var returnLogin: Bool = false
    
    // MARK: - CONTENT BODY
    var body: some Scene {
        WindowGroup {
            NavigationStack() {
//                InitialLoginAccessView()
                InitialMoviesView(returnLogin: $returnLogin)
    //                .environment(\.managedObjectContext, persistenceController.persistentContainer.viewContext)
            }
            .navigationBarHidden(true)
        }
    }
    
}
