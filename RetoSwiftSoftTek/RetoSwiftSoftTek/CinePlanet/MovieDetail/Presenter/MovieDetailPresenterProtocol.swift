//
//  MovieDetailPresenterProtocol.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation

protocol MovieDetailPresenterProtocol: ObservableObject {
    
    // MARK: - PROPERTIES
    var movie: ListMovieModel { get set }
    var isNavigating: Bool { get set }
    
    // MARK: - FUNCTIONS
    
}
