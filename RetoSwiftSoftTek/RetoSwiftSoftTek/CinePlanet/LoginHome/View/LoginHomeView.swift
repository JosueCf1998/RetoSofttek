//
//  LoginHomeView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

struct LoginHomeView<Presenter: LoginHomePresenterProtocol>: View {
    
    // MARK: - PROPERTIES
    @StateObject private var presenter: Presenter
    @Binding private var returnLogin: Bool
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isSecure: Bool = true
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
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
                        Image("background-spiderman")
                            .resizable()
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
                    ZStack() {
                        VStack() {
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
                            Spacer()
                        }
                        
                        VStack {
                            VStack(alignment: .leading, spacing: 50) {
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
                                // MARK: - SECTION FORM
                                VStack(spacing: 20) {
                                    // MARK: - INPUT USER
                                    VStack(spacing: 8) {
                                        TextField("Usuario", text: $presenter.userName.text)
                                            .padding(16)
                                            .background(Color(.systemGray6))
                                            .keyboardType(.asciiCapable)
                                            .autocapitalization(.none)
                                            .disableAutocorrection(true)
                                            .cornerRadius(10)
                                        if presenter.userName.validation == .error {
                                            Text(presenter.userName.errorMessage)
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.red)
                                        }
                                    }
                                    
                                    
                                    // MARK: - INPUT PASSWORD
                                    VStack(spacing: 8) {
                                        if isSecure {
                                            SecureField("Contraseña", text: $presenter.password.text)
                                                .padding(16)
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.black)
                                                .background(Color(.systemGray6))
                                                .keyboardType(.asciiCapable)
                                                .autocapitalization(.none)
                                                .disableAutocorrection(true)
                                                .cornerRadius(10)
                                        } else {
                                            TextField("Contraseña", text: $presenter.password.text)
                                                .padding(16)
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.black)
                                                .background(Color(.systemGray6))
                                                .keyboardType(.asciiCapable)
                                                .autocapitalization(.none)
                                                .disableAutocorrection(true)
                                                .cornerRadius(10)
                                        }
                                        if presenter.password.validation == .error {
                                            Text(presenter.password.errorMessage)
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                                .textFieldStyle(PlainTextFieldStyle())
                                
                                // MARK: - SECTION BUTTON
                                VStack(spacing: 25) {
                                    Button {
                                        presenter.validateCredentials()
                                    } label: {
                                        HStack() {
                                            Text("Iniciar Sesión")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 16)
                                        .background(Color.blue)
                                        .cornerRadius(10000)
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                // MARK: - SECTION FOOTER
                                VStack(spacing: 16) {
                                    Button {
                                        // TODO: REGISTRATE AQUI
                                    } label: {
                                        HStack() {
                                            Spacer()
                                            Text("Aun no tienes una cuenta?")
                                                .font(.system(size: 15))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                    }
                                    Button {
                                        // TODO: OLVIDAR CONTRASEÑA
                                    } label: {
                                        HStack() {
                                            Spacer()
                                            Text("Olvidaste tu contraseña?")
                                                .font(.system(size: 15))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                        .padding()
                        .navigationDestination(isPresented: $presenter.isNavigating) {
                            InitialMoviesView(returnLogin: $returnLogin)
                        }
                    }
                }
                .padding(20)
            }
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        
    }
    
}

