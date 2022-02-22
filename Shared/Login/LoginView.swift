//
//  LoginView.swift
//  Contabilizei (iOS)
//
//  Created by Pedro Veloso on 21/02/22.
//

import SwiftUI

struct LoginView: View {
    @State var login: String = ""
    @State var password: String = ""
    @State var rememberMe: Bool = false
//
    @State var isLoading: Bool = false
//
    
    var body: some View {
        ZStack {
            LoginBackgroundView()
            
            VStack {
                LogoView()
                
                Spacer()
                
                FormView(login: $login,
                         password: $password,
                         rememberMe: $rememberMe)
                
                Spacer()
                
                Button {
                    isLoading.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text("Entrar")
                            .padding()
                        Spacer()
                    }
                }
                .tint(.white)
                .background(Color.sapphire)
                .ignoresSafeArea(.all, edges: .bottom)
            }
                
//                Group {
//                    HStack {
//                        Image(systemName: "person.circle")
//                            .foregroundColor(
//                                focusedField == .login ? .blue : .gray
//                            )
//                        TextField("E-mail ou CPF",
//                                  text: $login)
//                            .focused($focusedField, equals: .login)
//                    }
//                    .modifier(CustomBorderViewModifier(highlight: focusedField == .login))
//
//                    HStack {
//                        Image(systemName: "lock.circle")
//                            .foregroundColor(
//                                focusedField == .password ? .blue : .gray
//                            )
//                        SecureField.init("Senha", text: $password)
//                            .focused($focusedField, equals: .password)
//                    }
//                    .modifier(CustomBorderViewModifier(highlight: focusedField == .password))
//
//                }
//                .font(.title3)
//                .padding(.horizontal, 24)
//                .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
//
//                HStack {
//                    Text("Manter-me conectado")
//                        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 4)
//                        .background(.white.opacity(0.5))
//                        .cornerRadius(12)
//                    Spacer()
//                    Toggle("", isOn: $rememberMe)
//                        .fixedSize()
//                        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
//                }
//                .padding(.horizontal, 24)
//
//                Button {
//                    print("clicked")
//                    isLoading.toggle()
//                } label: {
//                    if isLoading {
//                    ProgressView()
//                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
//                        .padding(8)
//                    } else {
//                        Text("Log in")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 24)
//                            .padding(.vertical, 6)
//
//                    }
//                }
//                .buttonStyle(BorderedProminentButtonStyle())
//                .cornerRadius(16)
//                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
//                .padding(.top, 8)
//            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
.previewInterfaceOrientation(.portrait)
    }
}

private struct LoginBackgroundView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("bg1", bundle: nil)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
                .blur(radius: 1.5)
        }
    }
}


private struct LogoView: View {
    var body: some View {
        HStack {
            Image("logo", bundle: nil)
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .padding(.top, 16)
                .padding(.leading, 24)
            Spacer()
        }
    }
}

struct FormView: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var rememberMe: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Entre na sua conta")
                    .font(.largeTitle)
                    .bold()
                
                Text("e-mail / CPF")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "person.text.rectangle")
                        .foregroundColor(.gainsboro)
                    TextField("Digite e-mail ou CPF", text: $login)
                        .foregroundColor(.gray)
                }
                .modifier(CustomBorderViewModifier(highlight: false))
                
                Text("Senha")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "lock.circle")
                        .foregroundColor(.gainsboro)
                    
                    SecureField.init("Digite sua senha", text: $password)
                        .foregroundColor(.gray)
                }
                .modifier(CustomBorderViewModifier(highlight: false))
                
                HStack {
                    Spacer()
                    Toggle("Manter-me conectado", isOn: $rememberMe)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fixedSize()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
