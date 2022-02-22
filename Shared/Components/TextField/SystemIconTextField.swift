//
//  IconTextField.swift
//  Contabilizei
//
//  Created by Pedro Veloso on 22/02/22.
//

import SwiftUI

struct SystemIconTextField: View {
    var title: String
    var iconSystemName: String
    
    var titleColor: Color = .gray
    var iconColor: Color = .gainsboro
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconSystemName)
                .foregroundColor(iconColor)
            TextField(title, text: $text)
                .foregroundColor(titleColor)
        }
    }
}

struct SystemIconTextField_Previews: PreviewProvider {
    static var previews: some View {
        SystemIconTextField(title: "E-mail ou CPF",
                            iconSystemName: "person.text.rectangle",
                            text: .constant(""))
    }
}
