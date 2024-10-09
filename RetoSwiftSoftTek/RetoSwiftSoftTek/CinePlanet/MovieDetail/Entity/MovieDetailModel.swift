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
    
}
