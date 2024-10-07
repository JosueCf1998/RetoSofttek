//
//  MoviesView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

struct MoviesView<Presenter: MoviesPresenterProtocol>: View {
    
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
                VStack() {
                    ZStack() {
                        RadialGradient(
                            gradient: Gradient(colors: [.black, .blue]),
                            center: .bottom,
                            startRadius: 4,
                            endRadius: 800
                        )
                        .opacity(0.7)
                    }
                }
                .ignoresSafeArea(.all)
                .onTapGesture {
                }
                
                VStack() {
                    HStack() {
                        Image(systemName: "play.tv.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Spacer()
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .center, spacing: 20) {
                            Text("Escoge tus peliculas favoritas")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                            
                        }
                        
                        
                        
                        VStack(alignment: .leading,spacing: 16) {
                            // MARK: - SECTION IMAGE
                            Image(systemName: "play.tv.fill")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            // MARK: - SECTION TITLE
                            Text("CineStart")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        // MARK: - SECTION SUBTITLE
                        Text("Las mejores peliculas y estrenos, en un solo lugar! 🍿❤")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                        
                    }
                }
                .padding(.horizontal, 16)
//                .navigationDestination(isPresented: $presenter.isNavigating) {
//                    let presenter = presenter.navigateToLoginHome() as! LoginHomePresenter
//                    LoginHomeView(presenter: presenter)
//                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden()
        
        /*
        NavigationStack {
            ZStack() {
                Color.black
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                    }
                VStack {
                    Button {
                        presenter.isNavigating = true
                    } label: {
                        Text("DETALLE")
                    }
                    List {
                        ForEach(presenter.movies, id: \.self) { movie in
                            // Aquí, pasamos la película a la ruta del NavigationStack
                            Button {
        //                        path1.append(movie) // Añadimos la película seleccionada a la ruta
                            } label: {
                                Text(movie.title ?? "Unknown Title")
                            }
                        }
                    }
                    .navigationTitle("Movies")
                    .onAppear {
//                        presenter.fetchMovies()
                    }
                    // Configuramos la ruta hacia la vista de detalle de película
                    .navigationDestination(for: Movie.self) { movie in
        //                presenter.navigateToMovieDetail(for: movie)
                    }
                }
//                .navigationDestination(isPresented: $presenter.isNavigating) {
//                    let presenter = presenter.navigateToMovieDetail(for: Movie() as! MovieDetailPresenter
//                    MovieDetailView(presenter: presenter)
//                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden()
         
         */
    }
    
}

