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
    @Binding private var returnLogin: Bool
    
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focusInput: InputsModel?
    @State private var focusKeyboard: Bool = false
    
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
                    EmptyView()
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
                focusInput = .document
                dismissKeyboard()
            }
            
            VStack(spacing: 20) {
                HStack() {
                    Image(systemName: "play.tv.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .onTapGesture {
                            returnLogin = false
                        }
                }
                VStack(alignment: .leading, spacing: 30) {
                    // MARK: - SECTION TITLE
                    VStack(alignment: .center, spacing: 10) {
                        Text("Escoge tus peliculas favoritas")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        HStack() {
                            TextField("Ingresa el nombre de una película", text: $presenter.inputSearch)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .keyboardType(.asciiCapable)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .background(Color(.systemGray6))
                                .cornerRadius(10000)
                        }
                        .onChange(of: presenter.inputSearch) {
                            presenter.getSearchMovies()
                        }
                        .onTapGesture {
                            focusInput = .search
                            focusKeyboard = true
                        }
                    }
                    // MARK: - SECTION LIST MOVIES
                    if !focusKeyboard {
                        ScrollListMovies(
                            listMovies: $presenter.listMovies,
                            loadMoreList: {
                                presenter.getListMovies()
                            },
                            selectedMovieDetail: { item in
                                presenter.validateMovieDetail(item)
                            }
                        )
                    } else {
                        VStack(alignment: .leading, spacing: 12) {
                            if presenter.searchMovies.count > 0 {
                                Text("Resultados:")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                ScrollView {
                                    VStack(alignment: .leading, spacing: 8) {
                                        ForEach(presenter.searchMovies, id: \.self) { item in
                                            ZStack() {
                                                HStack(spacing: 0) {
                                                    Text(item.title)
                                                        .font(.system(size: 15))
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.leading)
                                                    Spacer()
                                                }
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(
                                                    Rectangle()
                                                        .background(.gray)
                                                        .opacity(0.2)
                                                        .cornerRadius(16)
                                                )
                                            }
                                            .onTapGesture {
                                                presenter.validateMovieDetailMemory(item)
                                            }
                                        }
                                    }
                                    .onTapGesture {
                                        dismissKeyboard()
                                    }
                                }
                            } else {
                                if presenter.recentMovies.count > 0 {
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text("Buscados Recientemente:")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        ScrollView {
                                            VStack(alignment: .leading, spacing: 8) {
                                                ForEach(Array(presenter.recentMovies.enumerated()), id: \.offset) { index, item in
                                                    ZStack() {
                                                        HStack(spacing: 0) {
                                                            Text(item.title)
                                                                .font(.system(size: 15))
                                                                .foregroundColor(.white)
                                                                .multilineTextAlignment(.leading)
                                                            Spacer()
                                                            Button {
                                                                presenter.getDeleteMovieMemory(index)
                                                            } label: {
                                                                Image(systemName: "xmark.circle.fill")
                                                                    .resizable()
                                                                    .frame(width: 20, height: 20)
                                                                    .foregroundColor(.white)
                                                            }

                                                        }
                                                        .padding(.horizontal, 16)
                                                        .padding(.vertical, 8)
                                                        .background(
                                                            Rectangle()
                                                                .background(.gray)
                                                                .opacity(0.2)
                                                                .cornerRadius(16)
                                                        )
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .onTapGesture(){
                                        dismissKeyboard()
                                    }
                                }
                            }
                        }
                        .onAppear() {
                            presenter.inputSearch = ""
                            presenter.getListMoviesMemory()
                        }
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .alert("Alerta de Error", isPresented: $presenter.isShowingError) {
                Button("OK", role: .cancel) { returnLogin = false }
            }
            .onAppear() {
                focusKeyboard = false
            }
            .navigationDestination(isPresented: $presenter.isNavigating) {
                if let movie = presenter.selectedMovie {
                    InitialMovieDetailView(returnLogin: $returnLogin, movie: movie)
                } else { EmptyView() }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
    
}

// MARK: - EXTENSION
extension MoviesView {
    
    func dismissKeyboard() {
        focusKeyboard = false
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
