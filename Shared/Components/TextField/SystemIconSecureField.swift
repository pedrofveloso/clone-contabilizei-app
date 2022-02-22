//
//  SystemIconSecureField.swift
//  Contabilizei
//
//  Created by Pedro Veloso on 22/02/22.
//

import SwiftUI

struct SystemIconSecureField: View {
    var title: String
    var iconSystemName: String
    
    var titleColor: Color = .gray
    var iconColor: Color = .gainsboro
    
    @Binding var secureText: String
    
    var body: some View {
        HStack {
            Image(systemName: iconSystemName)
                .foregroundColor(iconColor)
            
            SecureField.init(title,
                             text: $secureText)
                .foregroundColor(titleColor)
        }
    }
}

struct SystemIconSecureField_Previews: PreviewProvider {
    static var previews: some View {
        SystemIconSecureField(title: "Senha",
                              iconSystemName: "lock.rectangle",
                              secureText: .constant(""))
    }
}
