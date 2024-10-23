//
//  EmailLoginView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct EmailLoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            topView
            emailField
            passwordField
            
            Button {
                //
            } label: {
                CustomButton(title: "Войти",
                             verticalPadding: 12)
            }
            .padding(.horizontal, 69)

            
            Spacer()
        }
        .padding(.horizontal, 46)
        .background(BackgoundGradientView())
    }
}

extension EmailLoginView {
    var topView: some View {
        VStack(spacing: 10) {
            Text("Вход")
                .foregroundStyle(Color("text_light"))
                .font(.system(size: 32))
        }
    }
    
    var emailField: some View {
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
    
    var passwordField: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Пароль")
                    .foregroundStyle(.textLight)
                Spacer()
            }
            SecureField("Введите ваш пароль", text: $password)
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
    EmailLoginView()
}
