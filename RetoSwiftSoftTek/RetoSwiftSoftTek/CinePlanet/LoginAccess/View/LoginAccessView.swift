//
//  LoginAccessView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import SwiftUI

struct LoginAccessView<Presenter: LoginAccessPresenterProtocol>: View {
    
    // MARK: - PROPERTIES
    @StateObject private var presenter: Presenter
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
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
                    Text("Iniciar Sesión")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                    
                    // Campo de texto para el nombre de usuario
                    TextField("Usuario", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    // Campo de texto para la contraseña
                    if isSecure {
                        SecureField("Contraseña", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    } else {
                        TextField("Contraseña", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Text(isSecure ? "Mostrar Contraseña" : "Ocultar Contraseña")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.bottom, 20)
                    }
                    
                    // Botón de inicio de sesión
                    Button(action: {
                        presenter.validateCredentials()
                    }) {
                        Text("Iniciar Sesión")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)

                    Spacer()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("Aceptar")))
                }
                .navigationDestination(isPresented: $presenter.isNavigating) {
                    let presenter = presenter.navigateToMovies()
                    LoginHomeView(presenter: presenter)
                }
            }
        }
    }
    
}

//
//#Preview {
//    LoginAccessView(presenter: LoginPresenter(interactor: LoginInteractor(), router: LoginRouter()))
//}
