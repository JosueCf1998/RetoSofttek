//
//  PreviewCoreDataProvider.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import CoreData

class PreviewCoreDataProvider {
    
    static var myMovie: Movie {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = Movie.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? Movie()
    }
    
}
