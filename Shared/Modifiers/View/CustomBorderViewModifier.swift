//
//  CustomBorderViewModifier.swift
//  Contabilizei
//
//  Created by Pedro Veloso on 21/02/22.
//

import SwiftUI

struct CustomBorderViewModifier: ViewModifier {
    var highlight: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 1)
                    .foregroundColor(
                        highlight ? .blue : .gray.opacity(0.4)
                    )
            )
    }
}
