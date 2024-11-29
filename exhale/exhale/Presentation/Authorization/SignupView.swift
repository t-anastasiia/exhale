//
//  SignupView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct SignupView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                Spacer()
                Text("Регистрация")
                    .font(.system(size: 32))
                    .foregroundStyle(.textLight)
                
                EmailTextField(email: $viewModel.email)
                PasswordTextField(password: $viewModel.password)
                PasswordTextField(password: $viewModel.repeatPassword,
                                  title: "Повторите пароль")
                
                Button {
                    viewModel.signUp()
                } label: {
                    CustomButton(title: "Зарегистрироваться",
                                 verticalPadding: 12)
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
            
            if viewModel.showError {
                VStack {
                    ErrorWindowView(text: viewModel.error)
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 46)
        .background(BackgoundGradientView())
        .onChange(of: viewModel.error) {
            viewModel.presentError()
        }
    }
}

#Preview {
    SignupView()
        .environmentObject(AuthViewModel())
}
