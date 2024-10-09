//
//  MoviesEntity.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import CoreData

struct ListMovieModel: Hashable {
    
    // MARK: - PROPERTIES
    let id: NSManagedObjectID
    let title: String
    let image: String
    let note: String
    let date: String
    let resume: String
    
    // MARK: - PROPERTIES
    static func convertList(_ data: [ListMovies]) -> [ListMovieModel] {
        data.map({
            ListMovieModel(
                id: $0.objectID,
                title: $0.title ?? "",
                image: $0.image ?? "",
                note: $0.note ?? "",
                date: "07-10-2024",
                resume: $0.resume ?? ""
            )
        })
    }
    
}
