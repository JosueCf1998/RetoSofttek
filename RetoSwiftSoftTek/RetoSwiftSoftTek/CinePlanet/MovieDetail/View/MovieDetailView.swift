//
//  MovieDetailView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

struct MovieDetailView<Presenter: MovieDetailPresenterProtocol>: View {
    
    // MARK: - PROPERTIES
    @StateObject private var presenter: Presenter
    
    // MARK: - CONSTRUCTOR
    init(
        presenter: Presenter
    ) {
        self._presenter = StateObject(wrappedValue: presenter)
    }
    
    // MARK: - CONTENT BODY
    var body: some View {
        NavigationStack {
            ZStack() {
                Color.black
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                    }
                VStack {
                    VStack(spacing: 20) {
                        Text(presenter.movie.title ?? "No Title")
                            .font(.largeTitle)
                            .padding()

                        Text("Release Date: \(presenter.movie.releaseDate ?? Date(), formatter: DateFormatter.longStyle)")
                        
                        Text("Rating: \(presenter.movie.rating)")
                        
                        Text("Genre: \(presenter.movie.genre ?? "Unknown Genre")")
                    }
                    .padding()
                    .navigationTitle("Movie Details")
                }
            }
        }
    }
    
}


extension DateFormatter {
    static let longStyle: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
