//
//  EmailTextField.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Эл. почта")
                    .foregroundStyle(.textLight)
                Spacer()
            }
            TextField("Введите ваш e-mail", text: $email)
                .frame(height: 75)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.textLight)
                )
        }
    }
}

struct EmailTextField_Previews: PreviewProvider {
    
    @State static var email: String = ""
    
    static var previews: some View {
        EmailTextField(email: $email)
    }
}
