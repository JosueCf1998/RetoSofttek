//
//  ListModelModelData.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

struct ListMoviesModelData: Codable {
    
    let dates: Dates
    let page: Int
    let results: [MovieDetailModelData]
    let totalPages: Int?
    let totalResults: Int?
    
}

struct Dates: Codable {
    let maximum, minimum: String
}

struct MovieDetailModelData: Codable {
    
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    let title: String
    let video: Bool
    let voteAverage: Double?
    let voteCount: Int?
    
}

extension MovieDetailModelData {
    var imageUrlString: String {
        var image = ""
        if let path = posterPath {
            image = Constants.imageBaseUrl + "w500" + path
        } else {
            image = ""
        }
        return image
    }
}
