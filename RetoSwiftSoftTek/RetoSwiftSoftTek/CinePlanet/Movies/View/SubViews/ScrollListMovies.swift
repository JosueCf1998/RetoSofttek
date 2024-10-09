//
//  ScrollListMovies.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 9/10/24.
//

import SwiftUI

struct ScrollListMovies: View {
    
    // MARK: - PROPERTIES
    @Binding var listMovies: [MovieDetailModel]
    let loadMoreList: () -> Void
    let selectedMovieDetail: (MovieDetailModel) -> Void
    
    // MARK: - CONSTRUCTOR
    init(
        listMovies: Binding<[MovieDetailModel]>,
        loadMoreList: @escaping() -> Void,
        selectedMovieDetail: @escaping(MovieDetailModel) -> Void
    ) {
        self._listMovies = listMovies
        self.loadMoreList = loadMoreList
        self.selectedMovieDetail = selectedMovieDetail
    }
    
    // MARK: - CONTENT BODY
    var body: some View {
        VStack() {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                    ForEach(listMovies, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CustomImageView(movie: item)
                            Text(item.title)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .onTapGesture {
                            selectedMovieDetail(item)
                        }
                    }
                    Spacer()
                        .frame(height: 1)
                        .onAppear() {
                            loadMoreList()
                        }
                })
            }
        }
    }
    
}

