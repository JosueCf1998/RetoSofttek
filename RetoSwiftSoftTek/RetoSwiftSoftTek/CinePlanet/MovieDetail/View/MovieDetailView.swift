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
    @Binding var returnLogin: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    
    // MARK: - CONSTRUCTOR
    init(
        presenter: Presenter,
        returnLogin: Binding<Bool>
    ) {
        self._presenter = StateObject(wrappedValue: presenter)
        self._returnLogin = returnLogin
    }
    
    // MARK: - CONTENT BODY
    var body: some View {
        ZStack() {
            VStack() {
                ZStack() {
                    RadialGradient(
                        gradient: Gradient(colors: [.black, .blue]),
                        center: .bottom,
                        startRadius: 4,
                        endRadius: 800
                    )
                    .opacity(0.7)
                    RadialGradient(
                        gradient: Gradient(colors: [.blue, .black]),
                        center: .top,
                        startRadius: 4,
                        endRadius: 800
                    )
                    .opacity(0.7)
                }
            }
            .ignoresSafeArea(.all)
            .onTapGesture {
            }
            
            VStack(spacing: 20) {
                HStack() {
                    Image(systemName: "play.tv.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    Spacer()
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .onTapGesture {
                            returnLogin = false
                        }
                }
                VStack(alignment: .leading, spacing: 30) {
                    // MARK: - SECTION RETURN VIEW
                    HStack() {
                        Image(systemName: "arrowshape.left.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                    }
                    // MARK: - SECTION MOVIES DETAIL
                    VStack(alignment: .leading, spacing: 10) {
                        Text(presenter.movie.title)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                        Text(presenter.movie.image)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        Text(presenter.movie.note)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        Text(presenter.movie.resume)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
    
}


extension DateFormatter {
    static let longStyle: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
