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

    @State var isLoading: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSize
    
    var body: some View {
        ZStack {
            LoginBackgroundView()
            
            if verticalSize == .regular {
                PortraitView(login: $login,
                             password: $password,
                             rememberMe: $rememberMe,
                             isLoading: $isLoading)
            } else {
                LandscapeView(login: $login,
                              password: $password,
                              rememberMe: $rememberMe,
                              isLoading: $isLoading)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

private struct PortraitView: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var rememberMe: Bool
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            LogoView()
            Spacer()
            Text("Entre na sua conta")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
            FormView(login: $login,
                     password: $password,
                     rememberMe: $rememberMe)
            Spacer()
            FullWidthButton(title: "Entrar",
                            isLoading: $isLoading)
                .tint(.white)
                .clipShape(Capsule())
                .background(Color.sapphire)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

private struct LandscapeView: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var rememberMe: Bool
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack {
            VStack {
                LogoView()
                    .padding()
                Spacer()
                HStack {
                    FormView(login: $login,
                             password: $password,
                             rememberMe: $rememberMe)
                }
                Spacer()
            }
            Button {
                isLoading.toggle()
            } label: {
                VStack{
                    Spacer()
                    Image(systemName: "chevron.right.2")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal, 36)
                    Spacer()
                }
                .background(Color.sapphire)
            }
        }
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

private struct FormView: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var rememberMe: Bool
    
    @FocusState var field: Field?
    
    enum Field: Hashable {
        case login
        case password
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("e-mail / CPF")
                .foregroundColor(.gray)
                .font(.headline)

            SystemIconTextField(title: "Digite e-mail ou CPF",
                                iconSystemName: "person.text.rectangle",
                                text: $login)
                .focused($field, equals: .login)
                .modifier(CustomBorderViewModifier(highlight: field == .login))
            
            Text("Senha")
                .foregroundColor(.gray)
                .font(.headline)
            
            SystemIconSecureField(title: "Digite sua senha",
                                  iconSystemName: "lock.rectangle",
                                  secureText: $password)
                .focused($field, equals: .password)
                .modifier(CustomBorderViewModifier(highlight: field == .password))
            
            HStack {
                Spacer()
                Toggle("Manter-me conectado", isOn: $rememberMe)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fixedSize()
            }
        }
        .padding(.horizontal, 24)
    }
}
