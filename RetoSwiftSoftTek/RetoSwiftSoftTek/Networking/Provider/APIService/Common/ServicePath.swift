//
//  ServicePath.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import Foundation

enum Constants {
    static var apiKey = "1080c2364c6824be935a81b573831480"
    static var apiBaseURL = "https://api.themoviedb.org"
//    static var imageBaseUrl = "https://image.tmdb.org/t/p/original"
    static var imageBaseUrl = "https://image.tmdb.org/t/p/"
}

enum ServicePath {
    
    // MARK: - LIST MOVIES
    static let listMovie = "\(Constants.apiBaseURL)/3/movie/upcoming?page=1&api_key=\(Constants.apiKey)"
    
}
