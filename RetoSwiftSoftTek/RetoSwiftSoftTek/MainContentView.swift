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
    
    // MARK: - CONTENT BODY
    var body: some Scene {
        WindowGroup {
            NavigationStack() {
                InitialLoginAccessView()
            }
            .navigationBarHidden(true)
        }
    }
    
}
