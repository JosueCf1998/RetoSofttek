//
//  MovieDetailModel.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

struct MovieDetailModel: Hashable {
    
    // MARK: - PROPERTIES
    let posterPath: String
    let title: String
    let voteAverage: Double?
    let releaseDate: String?
    let overview: String
    
    // MARK: - FUNCTIONS
    static func convertList(_ data: [MovieDetailModelData]) -> [MovieDetailModel] {
        data.map({
            MovieDetailModel(
                posterPath: $0.imageUrlString,
                title: $0.title,
                voteAverage: $0.voteAverage,
                releaseDate: $0.releaseDate,
                overview: $0.overview
            )
        })
    }
    
    static func convertMemory(_ data: [ListMovies]) -> [MovieDetailModel] {
        data.map({
            MovieDetailModel(
                posterPath: $0.posterPath ?? "",
                title: $0.title ?? "",
                voteAverage: $0.voteAverage,
                releaseDate: $0.releaseDate ?? "",
                overview: $0.overview ?? ""
            )
        })
    }

    static func convertMemory(_ data: MovieDetailModel) -> ListMovies {
        let task = ListMovies(context: CoreDataManager.shared.viewContext)
        task.posterPath = data.posterPath
        task.title = data.title
        task.voteAverage = data.voteAverage ?? 0.0
        task.releaseDate = data.releaseDate
        task.overview = data.overview
        return task
    }
    
}
