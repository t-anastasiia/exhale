//
//  PasswordTextField.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var password: String
    
    var title: String = "Пароль"
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(title)
                    .foregroundStyle(.textLight)
                Spacer()
            }
            SecureField("Введите ваш пароль", text: $password)
                .textInputAutocapitalization(.never)
                .frame(height: 75)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.textLight)
                )
        }
    }
}

#Preview {
    PasswordTextField(password: .constant(""))
}
