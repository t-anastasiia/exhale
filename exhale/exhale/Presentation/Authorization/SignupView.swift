//
//  SignupView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            Text("Регистрация")
                .font(.system(size: 32))
                .foregroundStyle(.textLight)
            
            EmailTextField(email: $email)
            PasswordTextField(password: $password)
            PasswordTextField(password: $repeatPassword,
                              title: "Повторите пароль")
            
            Button {
                //
            } label: {
                CustomButton(title: "Зарегистрироваться",
                             verticalPadding: 12)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding(.horizontal, 46)
        .background(BackgoundGradientView())
    }
}

#Preview {
    SignupView()
}
