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
    
    @FocusState var focusedField: Field?
    
    enum Field: Hashable {
        case login
        case password
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("bg1", bundle: nil)
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                    .blur(radius: 1.5)
            }
            VStack(spacing: 16) {
                Group {
                    TextField("E-mail ou CPF",
                              text: $login)
                        .focused($focusedField, equals: .login)
                        .modifier(CustomBorderViewModifier(highlight: focusedField == .login))
                    
                    SecureField.init("Senha", text: $password)
                        .focused($focusedField, equals: .password)
                        .modifier(CustomBorderViewModifier(highlight: focusedField == .password))
                }
                .font(.title3)
                .padding(.horizontal, 24)
                .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
                
                HStack {
                    Text("Manter-me conectado")
                        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.white)
                    Spacer()
                    Toggle("", isOn: $rememberMe)
                        .fixedSize()
                        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
                }
                .padding(.horizontal, 24)
                
                Button {
                    print("clicked")
                    isLoading.toggle()
                } label: {
                    if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding(2)
                    } else {
                        Text("ENTRAR")
                    }
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
                .font(.title3)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
.previewInterfaceOrientation(.portrait)
    }
}
