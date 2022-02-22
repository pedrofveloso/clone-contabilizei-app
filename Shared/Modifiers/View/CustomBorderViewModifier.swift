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
            .padding()
            .background(.background)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
            .overlay(
                Capsule()
                    .stroke(lineWidth: 2)
                    .foregroundColor(
                        highlight ? .sapphire : .gainsboro
                    )
            )
    }
}
