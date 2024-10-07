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
                        
                        // MARK: - SECTION SUBTITLE
                        Text("Las mejores peliculas y estrenos, en un solo lugar! 🍿❤")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                        
                        // MARK: - SECTION BUTTON
                        VStack(spacing: 25) {
                            Button {
                                presenter.isNavigating = true
                            } label: {
                                HStack() {
                                    Text("Ingresa con mi cuenta")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.blue)
                                .cornerRadius(10000)
                            }
                            Button {
                                // TODO: INGRESO POR FACEBOOK
                            } label: {
                                HStack() {
                                    Text("Ingresa con Facebook")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.blue)
                                .cornerRadius(10000)
                            }
                            Button {
                                // TODO: INGRESO POR GOOGLE
                            } label: {
                                HStack() {
                                    Text("Ingresa con Google")
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
                                    Text("Registrate Aqui!")
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
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                .navigationDestination(isPresented: $presenter.isNavigating) {
                    let presenter = presenter.navigateToLoginHome() as! LoginHomePresenter
                    LoginHomeView(presenter: presenter)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden()
    }
    
}


#Preview {
    LoginAccessView(presenter: LoginAccessPresenter(interactor: LoginAccessInteractor(), router: LoginAccessRouter()))
}
