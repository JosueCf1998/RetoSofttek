//
//  CustomImageView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 8/10/24.
//

import SwiftUI
import UIKit

struct CustomImageView: View {
    let movie: MovieDetailModel
    @ObservedObject var imageLoader = ImageService()
    
    init(
        movie: MovieDetailModel
    ) {
        self.movie = movie
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                if imageLoader.isLoading {
                    LoadingSubView()
                } else {
                    if self.imageLoader.image != nil {
                        Image(uiImage: self.imageLoader.image!)
                            .resizable()
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: 110, height: 150)
            .cornerRadius(50)
            .shadow(radius: 4)
        }
        .onAppear() {
            self.imageLoader.loadImage(with: self.movie.posterPath)
        }
    }
}

