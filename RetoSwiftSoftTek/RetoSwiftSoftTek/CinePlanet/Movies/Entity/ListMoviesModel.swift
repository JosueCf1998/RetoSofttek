//
//  ListMoviesModel.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

struct ListMoviesModel {
    
    // MARK: - PROPERTIES
    let page: Int
    let totalPages: Int?
    let totalResults: Int?
    
    // MARK: - FUNCTIONS
    static func convert(_ data: ListMoviesModelData) -> ListMoviesModel {
        return ListMoviesModel(
            page: data.page,
            totalPages: data.totalPages,
            totalResults: data.totalResults
        )
    }
    
}

