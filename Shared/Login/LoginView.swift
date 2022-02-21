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
                Image("logo", bundle: nil)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 72)
                    .padding(.bottom, 48)
                Group {
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(
                                focusedField == .login ? .blue : .gray
                            )
                        TextField("E-mail ou CPF",
                                  text: $login)
                            .focused($focusedField, equals: .login)
                    }
                    .modifier(CustomBorderViewModifier(highlight: focusedField == .login))
                    
                    HStack {
                        Image(systemName: "lock.circle")
                            .foregroundColor(
                                focusedField == .password ? .blue : .gray
                            )
                        SecureField.init("Senha", text: $password)
                            .focused($focusedField, equals: .password)
                    }
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
                        .background(.white.opacity(0.5))
                        .cornerRadius(12)
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
                        .padding(8)
                    } else {
                        Text("Log in")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 6)
                            
                    }
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .cornerRadius(16)
                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
                .padding(.top, 8)
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
