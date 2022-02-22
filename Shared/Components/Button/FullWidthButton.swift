//
//  FullWidthButton.swift
//  Contabilizei
//
//  Created by Pedro Veloso on 22/02/22.
//

import SwiftUI

struct FullWidthButton: View {
    var title: String
    var progressColor: Color = .white
    
    @Binding var isLoading: Bool
    
    var body: some View {
        Button {
            isLoading.toggle()
        } label: {
            HStack {
                Spacer()
                if isLoading {
                    LoadingView(color: progressColor)
                } else {
                    TextView(title: title)
                }
                Spacer()
            }
        }
    }
}

private struct LoadingView: View {
    var color: Color
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .tint(color)
            .padding()
    }
}

private struct TextView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .padding()
    }
}

struct FullWidthButton_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthButton(title: "Entrar",
                        isLoading: .constant(false))
            .background(.black)
    }
}
